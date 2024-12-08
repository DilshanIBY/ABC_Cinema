<% // BACKEND IMPORTS %>
<% // Import Related Models & Controllers... %>

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
    
