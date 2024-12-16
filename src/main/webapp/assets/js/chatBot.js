////////////////////////////////////
////////// CHATBOT Scripts /////////
////////////////////////////////////
       
document.addEventListener('DOMContentLoaded', function() {
    const chatBubble = document.getElementById('chatBubble');
    const chatWindow = document.getElementById('chatWindow');
    const chatHeader = document.getElementById('chatHeader');
    const closeChat = document.getElementById('closeChat');
    const newChat = document.getElementById('newChat');
    const messageInput = document.getElementById('messageInput');
    const sendMessage = document.getElementById('sendMessage');
    const chatBody = document.getElementById('chatBody');

    // Drag state variables
    let isDraggingBubble = false;
    let isDraggingWindow = false;
    let moveStarted = false;
    let startX, startY, initialX, initialY;
    let bubbleOffset = { x: 0, y: 0 };
    let windowOffset = { x: 0, y: 0 };
    let isMobile = window.innerWidth <= 480;

    // Update mobile state on resize
    window.addEventListener('resize', function() {
        isMobile = window.innerWidth <= 480;
        if (isMobile) {
            // Reset positions on mobile
            chatWindow.style.left = '';
            chatWindow.style.top = '';
            chatWindow.style.right = '0';
            chatWindow.style.bottom = '0';
            chatBubble.style.left = '';
            chatBubble.style.top = '';
            chatBubble.style.right = '10px';
            chatBubble.style.bottom = '10px';
        }
    });

    // Touch event handlers
    chatBubble.addEventListener('touchstart', handleTouchStart.bind(null, true), { passive: false });
    chatHeader.addEventListener('touchstart', handleTouchStart.bind(null, false), { passive: false });
    document.addEventListener('touchmove', handleTouchMove, { passive: false });
    document.addEventListener('touchend', handleDragEnd);

    // Mouse event handlers
    chatBubble.addEventListener('mousedown', function(e) {
        if (!isMobile) handleDragStart(e, true);
    });

    chatHeader.addEventListener('mousedown', function(e) {
        if (!isMobile) handleDragStart(e, false);
    });

    document.addEventListener('mousemove', function(e) {
        if (!isMobile) handleDrag(e);
    });

    document.addEventListener('mouseup', handleDragEnd);

    function handleTouchStart(isBubble, e) {
        if (isMobile) return;
        e.preventDefault();
        const touch = e.touches[0];
        handleDragStart({ clientX: touch.clientX, clientY: touch.clientY }, isBubble);
    }

    function handleTouchMove(e) {
        if (isMobile) return;
        if (isDraggingBubble || isDraggingWindow) {
            e.preventDefault();
            const touch = e.touches[0];
            handleDrag({ clientX: touch.clientX, clientY: touch.clientY });
        }
    }

    function handleDragStart(e, isBubble) {
        if (isMobile) return;
        startX = e.clientX;
        startY = e.clientY;

        if (isBubble) {
            isDraggingBubble = true;
            initialX = chatBubble.offsetLeft;
            initialY = chatBubble.offsetTop;
            chatBubble.classList.add('dragging');
        } else {
            isDraggingWindow = true;
            initialX = chatWindow.offsetLeft;
            initialY = chatWindow.offsetTop;
            chatWindow.classList.add('dragging');
        }

        moveStarted = false;
    }

    function handleDrag(e) {
        if (isMobile) return;
        if (isDraggingBubble || isDraggingWindow) {
            e.preventDefault();
            const dx = e.clientX - startX;
            const dy = e.clientY - startY;

            if (Math.abs(dx) > 5 || Math.abs(dy) > 5) {
                moveStarted = true;
            }

            const element = isDraggingBubble ? chatBubble : chatWindow;
            const maxX = window.innerWidth - element.offsetWidth;
            const maxY = window.innerHeight - element.offsetHeight;

            let newX = initialX + dx;
            let newY = initialY + dy;

            newX = Math.min(Math.max(0, newX), maxX);
            newY = Math.min(Math.max(0, newY), maxY);

            element.style.left = newX + 'px';
            element.style.top = newY + 'px';
            element.style.right = 'auto';
            element.style.bottom = 'auto';

            if (isDraggingBubble) {
                bubbleOffset = { x: newX, y: newY };
            } else {
                windowOffset = { x: newX, y: newY };
            }
        }
    }

    function handleDragEnd() {
        if (isDraggingBubble) {
            chatBubble.classList.remove('dragging');
            isDraggingBubble = false;
        }
        if (isDraggingWindow) {
            chatWindow.classList.remove('dragging');
            isDraggingWindow = false;
        }
    }

    // Chat bubble click handler
    chatBubble.addEventListener('click', function () {
        if (!moveStarted) {
            chatWindow.style.display = 'flex'; // Make sure the element is visible
            setTimeout(() => chatWindow.classList.add('show'), 0); // Trigger animation
            chatBubble.style.display = 'none';
        }
    });

    // Close chat handler
    closeChat.addEventListener('click', function () {
        chatWindow.classList.remove('show'); // Start fade-out animation
        setTimeout(() => {
            chatWindow.style.display = 'none'; // Hide completely after animation
            chatBubble.style.display = 'flex';
        }, 100); // Match the transition duration
    });
    

    // New chat handler
    newChat.addEventListener('click', function () {
        // Clear all messages from the chat window
        chatBody.innerHTML = '';

        // Create message wrapper for the bot message
        const messageWrapper = document.createElement('div');
        messageWrapper.classList.add('any-msgs');

        // Add image for the bot
        const img = document.createElement('img');
        img.src = 'assets/img/icons/any.png'; // Bot's image
        img.alt = 'ABC Cinema Bot';
        img.classList.add('from-any-img');
        messageWrapper.appendChild(img);

        // Create message div for the bot's message
        const messageDiv = document.createElement('div');
        messageDiv.classList.add('message', 'bot-message');
        messageDiv.textContent = "Ok. Let's start over. Any happy to help you for anything? 😄"; // Bot's message
        messageWrapper.appendChild(messageDiv);

        // Append the message wrapper to the chat body
        chatBody.appendChild(messageWrapper);

        // Scroll to the latest message
        chatBody.scrollTop = chatBody.scrollHeight;

        // Optional: Reset any other variables or states related to the current chat session
        messageInput.value = ''; // Clear the message input field
    });


    // Prevent text selection during drag
    chatHeader.addEventListener('selectstart', function(e) {
        e.preventDefault();
    });

    // Handle window resize
    let resizeTimeout;
    window.addEventListener('resize', function() {
        clearTimeout(resizeTimeout);
        resizeTimeout = setTimeout(function() {
            const maxX = window.innerWidth - chatWindow.offsetWidth;
            const maxY = window.innerHeight - chatWindow.offsetHeight;

            // Adjust chat window position if it's outside viewport
            if (chatWindow.offsetLeft > maxX) {
                chatWindow.style.left = maxX + 'px';
            }
            if (chatWindow.offsetTop > maxY) {
                chatWindow.style.top = maxY + 'px';
            }

            // Adjust chat bubble position
            const bubbleMaxX = window.innerWidth - chatBubble.offsetWidth;
            const bubbleMaxY = window.innerHeight - chatBubble.offsetHeight;

            if (chatBubble.offsetLeft > bubbleMaxX) {
                chatBubble.style.left = bubbleMaxX + 'px';
            }
            if (chatBubble.offsetTop > bubbleMaxY) {
                chatBubble.style.top = bubbleMaxY + 'px';
            }
        }, 100);
    });

    // Handle visibility change
    document.addEventListener('visibilitychange', function() {
        if (!document.hidden) {
            // Ensure elements are within viewport when tab becomes active
            const maxX = window.innerWidth - chatWindow.offsetWidth;
            const maxY = window.innerHeight - chatWindow.offsetHeight;

            if (chatWindow.offsetLeft > maxX) {
                chatWindow.style.left = maxX + 'px';
            }
            if (chatWindow.offsetTop > maxY) {
                chatWindow.style.top = maxY + 'px';
            }
        }
    });

    // Add touch event handlers for mobile
    let touchStartX, touchStartY;

    function handleTouchStart(e) {
        const touch = e.touches[0];
        touchStartX = touch.clientX;
        touchStartY = touch.clientY;
    }

    function handleTouchMove(e) {
        if (!isMobile) {
            const touch = e.touches[0];
            const deltaX = touchStartX - touch.clientX;
            const deltaY = touchStartY - touch.clientY;

            // If the movement is more like a scroll than a drag
            if (Math.abs(deltaY) > Math.abs(deltaX)) {
                return; // Allow default scroll behavior
            }

            e.preventDefault(); // Prevent scrolling when dragging horizontally
        }
    }

    // Add smooth scrolling for chat body
    chatBody.addEventListener('wheel', function(e) {
        e.preventDefault();
        const delta = e.deltaY || e.detail || e.wheelDelta;
        chatBody.scrollTop += delta;
    }, { passive: false });

    // Focus input when chat window opens
    const focusInput = () => {
        if (chatWindow.style.display === 'flex') {
            setTimeout(() => messageInput.focus(), 300);
        }
    };

    chatBubble.addEventListener('click', focusInput);

    // Handle emoji input if supported
    messageInput.addEventListener('input', function() {
        this.style.height = 'auto';
        const newHeight = Math.min(this.scrollHeight, 100);
        this.style.height = newHeight + 'px';
    });

    // Add sound effect for messages (optional)
    const messageSound = new Audio('');
    messageSound.volume = 0.2;

    // Enhanced message handling with typing indicator
    function showTypingIndicator() {
        const typingDiv = document.createElement('div');
        typingDiv.className = 'message bot-message typing-indicator';
        typingDiv.innerHTML = 'Typing<span>.</span><span>.</span><span>.</span>';
        chatBody.appendChild(typingDiv);
        chatBody.scrollTop = chatBody.scrollHeight;
        return typingDiv;
    }
    
    
    
    
    
    
    // Message adding
    function addMessage(message, isUser = false, isHtml = false) {
        // Create parent div for user or bot messages
        const messageWrapper = document.createElement('div');
        messageWrapper.classList.add(isUser ? 'user-msgs' : 'any-msgs');

        // Add image for user or bot
        const img = document.createElement('img');
        img.src = isUser ? 'assets/img/icons/user.jpg' : 'assets/img/icons/any.png';
        img.alt = isUser ? 'User' : 'ABC Cinema Bot';
        img.classList.add(isUser ? 'from-user-img' : 'from-any-img');
        messageWrapper.appendChild(img);

        // Create message div
        const messageDiv = document.createElement('div');
        messageDiv.classList.add('message', isUser ? 'user-message' : 'bot-message');

        // Append message content
        if (!isUser && !isHtml) {
            // Handle real-time typing for bot messages with HTML rendering
            const tempDiv = document.createElement('div');
            tempDiv.innerHTML = message; // Parse HTML into segments
            const segments = Array.from(tempDiv.childNodes); // Extract child nodes
            let segmentIndex = 0;

            function typeSegment() {
                if (segmentIndex < segments.length) {
                    const segment = segments[segmentIndex];

                    if (segment.nodeType === Node.TEXT_NODE) {
                        // Handle text node typing character by character
                        const text = segment.textContent;
                        let charIndex = 0;

                        function typeCharacter() {
                            if (charIndex < text.length) {
                                messageDiv.append(text[charIndex]); // Append one character
                                charIndex++;
                                chatBody.scrollTop = chatBody.scrollHeight; // Scroll as content grows
                                setTimeout(typeCharacter, 10); // Typing speed for characters
                            } else {
                                segmentIndex++;
                                typeSegment(); // Move to the next segment
                            }
                        }

                        typeCharacter(); // Start typing the text node
                    } else {
                        // For non-text nodes (e.g., <b>, <i>), append them entirely
                        const clonedSegment = segment.cloneNode(true);
                        messageDiv.appendChild(clonedSegment);
                        segmentIndex++;
                        chatBody.scrollTop = chatBody.scrollHeight; // Scroll as content grows
                        setTimeout(typeSegment, 200); // Small pause for non-text elements
                    }
                }
            }

            typeSegment(); // Start typing the segments
        } else {
            if (isHtml) {
                messageDiv.innerHTML = message; // Render HTML content directly
            } else {
                messageDiv.textContent = message; // Escape plain text to prevent XSS
            }
        }

        // Append message div to the wrapper
        messageWrapper.appendChild(messageDiv);

        // Append the wrapper to the chat body
        chatBody.appendChild(messageWrapper);
        chatBody.scrollTop = chatBody.scrollHeight; // Scroll to the latest message
    }




    // Function to show a typing indicator
    function showTypingIndicator() {
        const typingDiv = document.createElement('div');
        typingDiv.classList.add('typing-indicator');
        typingDiv.innerHTML = '<span></span><span></span><span></span>';
        chatBody.appendChild(typingDiv);
        chatBody.scrollTop = chatBody.scrollHeight;
        return typingDiv;
    }

    // Enhanced message handling with servlet integration
    async function handleMessageEnhanced() {
        const message = messageInput.value.trim();
        if (message) {
            // Add the user's message to the chat
            addMessage(message, true);
            messageInput.value = '';

            // Show typing indicator
            const typingIndicator = showTypingIndicator();

            try {
                // Simulate typing delay
                await new Promise(resolve => setTimeout(resolve, 1500));

                // Prepare request payload
                const payload = {
                    message: message
                };

                // Send request to the ChatBotServlet
                const response = await fetch('http://localhost:8080/ABC_Cinema_Reservation/chat', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(payload)
                });

                typingIndicator.remove();

                if (response.ok) {
                    // Parse the API response
                    const data = await response.json();
                    const botMessage = data.response || 'Sorry, I didn\'t understand that.';
                    addMessage(botMessage, false, false);
                } else {
                    addMessage('An error occurred while connecting to the chatbot. Please try again later.');
                }
            } catch (error) {
                console.error('Error:', error);
                typingIndicator.remove();
                addMessage('An error occurred. Please check your network connection.');
            }
        }
    }

    // Event listeners for sending messages
    sendMessage.addEventListener('click', handleMessageEnhanced);

    messageInput.addEventListener('keypress', function (e) {
        if (e.key === 'Enter' && !e.shiftKey) {
            e.preventDefault();
            handleMessageEnhanced();
        }
    });



});