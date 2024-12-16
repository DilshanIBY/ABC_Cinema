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
        
        <div class="chat-Top" id="chatTop">
            <img src="assets/img/icons/any.png" alt="ABC Cinema Bot" class="bot-avatar">
            <div>
                <h6 class="mb-0 text-white">Hello Dilshan!</h6>
                <small class="text-gold">ANY Online</small>
            </div>
            <div id="chat-buttons">
                <span id="newChat" class="chat-btn mdi mdi-chat-plus-outline"></span>
                <span id="closeChat" class="chat-btn mdi mdi-window-close"></span>
            </div>
        </div>
        
        <div class="chat-Bottom" id="chatBottom">
            <!-- Chat Body -->
            <div class="chat-body" id="chatBody">
                <div class="any-msgs">
                    <img src="assets/img/icons/any.png" alt="ABC Cinema Bot" class="from-any-img">
                    <div class="message bot-message">
                        Hello! ANY here. How can I assist you today? &#128578;
                    </div>
                </div>
            </div>
            <!-- Chat Footer -->
            <div class="chat-footer">
                <div class="input-group">
                    <input type="text" class="form-control chat-input" placeholder="Type your message..." id="messageInput">
                    <button class="btn send-btn" id="sendMessage">
                        <span class="mdi mdi-send-variant" style="font-size: 20px;"></span>
                    </button>
                </div>
            </div>
        </div>
        
    </div>

</div>
    
