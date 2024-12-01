<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC CINEMA ChatBot</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --gold: #cda45e;
            --chocolate: #0c0b09;
            --oil: #1a1814;
            --black: #000000;
        }

        .chat-bubble {
            position: fixed;
            bottom: 20px;
            right: 20px;
            width: clamp(50px, 12vw, 60px);
            height: clamp(50px, 12vw, 60px);
            background: var(--gold);
            border-radius: 50%;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.3);
            z-index: 1000;
            user-select: none;
            touch-action: none;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .chat-bubble:hover {
            transform: scale(1.1);
            box-shadow: 0 4px 20px rgba(205, 164, 94, 0.4);
        }

        .chat-bubble i {
            color: var(--chocolate);
            font-size: clamp(20px, 4vw, 24px);
            pointer-events: none;
        }

        .chat-bubble.dragging {
            cursor: move;
            opacity: 0.8;
            box-shadow: 0 8px 25px rgba(205, 164, 94, 0.6);
        }

        /* Chat Window Styles */
        .chat-window {
            position: fixed;
            bottom: 100px;
            right: 20px;
            width: clamp(280px, 90vw, 350px);
            height: clamp(400px, 80vh, 500px);
            background: rgba(26, 24, 20, 0.8);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            border: 1px solid var(--gold);
            box-shadow: 0 0 20px rgba(205, 164, 94, 0.2);
            display: none;
            flex-direction: column;
            z-index: 1000;
            overflow: hidden;
            transition: box-shadow 0.3s;
        }

        @media (max-width: 480px) {
            .chat-window {
                bottom: 0;
                right: 0;
                width: 100%;
                height: calc(100% - 70px);
                border-radius: 15px 15px 0 0;
            }

            .chat-bubble {
                bottom: 10px;
                right: 10px;
            }
        }

        .chat-window.dragging {
            box-shadow: 0 8px 30px rgba(205, 164, 94, 0.4);
            opacity: 0.95;
        }

        .chat-header {
            background: rgba(12, 11, 9, 0.9);
            padding: 15px;
            border-radius: 15px 15px 0 0;
            border-bottom: 1px solid var(--gold);
            cursor: move;
            user-select: none;
            display: flex;
            align-items: center;
        }

        .chat-header:hover {
            background: rgba(12, 11, 9, 1);
        }

        .chat-body {
            flex-grow: 1;
            overflow-y: auto;
            padding: 15px;
            scrollbar-width: thin;
            scrollbar-color: var(--gold) var(--chocolate);
        }

        .chat-body::-webkit-scrollbar {
            width: 6px;
        }

        .chat-body::-webkit-scrollbar-track {
            background: var(--chocolate);
        }

        .chat-body::-webkit-scrollbar-thumb {
            background-color: var(--gold);
            border-radius: 3px;
        }

        .chat-footer {
            padding: 15px;
            border-top: 1px solid var(--gold);
            background: rgba(12, 11, 9, 0.9);
        }

        .bot-avatar {
            width: clamp(25px, 6vw, 30px);
            height: clamp(25px, 6vw, 30px);
            border-radius: 50%;
            margin-right: 10px;
        }

        .text-gold {
            color: #ccc;
            font-size: clamp(12px, 3vw, 14px);
        }

        .chat-header h6 {
            font-size: clamp(14px, 3.5vw, 16px);
        }

        .message {
            margin-bottom: 15px;
            max-width: 85%;
            animation: fadeIn 0.3s ease;
            font-size: clamp(13px, 3.5vw, 15px);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .bot-message {
            background: rgba(205, 164, 94, 0.1);
            padding: clamp(8px, 2vw, 10px);
            border-radius: 15px;
            margin-right: auto;
            color: var(--gold);
            word-wrap: break-word;
        }

        .user-message {
            background: rgba(205, 164, 94, 0.2);
            padding: clamp(8px, 2vw, 10px);
            border-radius: 15px;
            margin-left: auto;
            color: white;
            word-wrap: break-word;
        }

        .chat-input {
            background: rgba(12, 11, 9, 0.9);
            border: 1px solid var(--gold);
            color: white;
            font-size: clamp(13px, 3.5vw, 15px);
            padding: clamp(8px, 2vw, 10px);
        }

        .chat-input:focus {
            background: rgba(12, 11, 9, 0.9);
            border: 1px solid var(--gold);
            color: white;
            box-shadow: none;
        }

        .send-btn {
            background: var(--gold);
            border: none;
            color: var(--chocolate);
            padding: clamp(8px, 2vw, 10px);
        }

        .send-btn:hover {
            background: #b68f45;
        }

        .send-btn i {
            font-size: clamp(14px, 3.5vw, 16px);
        }
    </style>
</head>
<body>
    <!-- Chat Bubble -->
    <div class="chat-bubble" id="chatBubble">
        <i class="fas fa-comments"></i>
    </div>

    <!-- Chat Window -->
    <div class="chat-window" id="chatWindow">
        <!-- Chat Header -->
        <div class="chat-header" id="chatHeader">
            <img src="assets/img/Up.jpg" alt="ABC Cinema Bot" class="bot-avatar">
            <div>
                <h6 class="mb-0 text-white">ABC Cinema Assistant</h6>
                <small class="text-gold">Online</small>
            </div>
            <button class="btn-close btn-close-white ms-auto" id="closeChat"></button>
        </div>

        <!-- Chat Body -->
        <div class="chat-body" id="chatBody">
            <div class="message bot-message">
                Hello! Welcome to ABC Cinema. How can I assist you today?
            </div>
        </div>

        <!-- Chat Footer -->
        <div class="chat-footer">
            <div class="input-group">
                <input type="text" class="form-control chat-input" placeholder="Type your message..." id="messageInput">
                <button class="btn send-btn" id="sendMessage">
                    <i class="fas fa-paper-plane"></i>
                </button>
            </div>
        </div>
    </div>

    <script>
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
    </script>
</body>
</html>