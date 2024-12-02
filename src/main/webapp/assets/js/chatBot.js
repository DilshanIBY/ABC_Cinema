////////////////////////////////////
////////// CHATBOT Scripts /////////
////////////////////////////////////
       
document.addEventListener('DOMContentLoaded', function() {
    const chatBubble = document.getElementById('chatBubble');
    const chatWindow = document.getElementById('chatWindow');
    const chatHeader = document.getElementById('chatHeader');
    const closeChat = document.getElementById('closeChat');
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
    chatBubble.addEventListener('click', function(e) {
        if (!moveStarted) {
            chatWindow.style.display = 'flex';
            chatBubble.style.display = 'none';
        }
    });

    // Close chat handler
    closeChat.addEventListener('click', function() {
        chatWindow.style.display = 'none';
        chatBubble.style.display = 'flex';
    });

    // Message handling
    function addMessage(message, isUser = false) {
        const messageDiv = document.createElement('div');
        messageDiv.classList.add('message');
        messageDiv.classList.add(isUser ? 'user-message' : 'bot-message');
        messageDiv.textContent = message;
        chatBody.appendChild(messageDiv);
        chatBody.scrollTop = chatBody.scrollHeight;
    }

    function handleMessage() {
        const message = messageInput.value.trim();
        if (message) {
            addMessage(message, true);
            messageInput.value = '';
            setTimeout(() => {
                addMessage('Thank you for your message. Our team will assist you shortly.');
            }, 1000);
        }
    }
    sendMessage.addEventListener('click', handleMessage);

    messageInput.addEventListener('keypress', function(e) {
        if (e.key === 'Enter') {
            handleMessage();
        }
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

    // Enhanced message handling
    async function handleMessageEnhanced() {
        const message = messageInput.value.trim();
        if (message) {
            // Play sound if not muted
            try {
                await messageSound.play();
            } catch (e) {
                console.log('Sound disabled or not supported');
            }

            // Add user message
            addMessage(message, true);
            messageInput.value = '';

            // Show typing indicator
            const typingIndicator = showTypingIndicator();

            // Simulate bot response after delay
            setTimeout(() => {
                typingIndicator.remove();
                addMessage('Thank you for your message. Our team will assist you shortly.');
            }, 1500);
        }
    }

    // Replace old handler with enhanced version
    sendMessage.removeEventListener('click', handleMessage);
    sendMessage.addEventListener('click', handleMessageEnhanced);

    messageInput.removeEventListener('keypress', function(e) {
        if (e.key === 'Enter') handleMessage();
    });
    messageInput.addEventListener('keypress', function(e) {
        if (e.key === 'Enter' && !e.shiftKey) {
            e.preventDefault();
            handleMessageEnhanced();
        }
    });
});