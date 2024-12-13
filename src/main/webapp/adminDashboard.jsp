<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<% // BACKEND IMPORTS %>
<% // Import Related Models & Controllers... %>

<!-- Head Section -->
<jsp:include page="temps/adminHeader.jsp" />
    
<!-- Navigation -->
<jsp:include page="temps/adminNavbar.jsp" />

<!-- Navigation -->
<jsp:include page="temps/adminSidemenu.jsp" />



<div class="row">

<section id="main-content" class="column column-offset-20">

        <!-- OVERVIEW Section -->
        <a class="anchor" name="overview"></a>
        <div class="row grid-responsive overview">

        </div>
        
        
        
        
        
        <!-- MOVIES Section -->
        <a class="anchor" name="movies"></a>
        <div class="row grid-responsive movies">
            <div class="column">
                <div class="card">
                    <div class="card-title">
                        <h3>Movie Management</h3>
                    </div>
                    <div class="card-block">
                        <div class="admin-panel">
                        <main>
                            <!-- Now Showing Section -->
                            <section id="now-showing">
                                <h2>Now Showing Movies</h2>
                                <div class="movie-gallery">
                                    <!-- Plus Icon for Adding Movies -->
                                    <div class="add-movie-card" data-modal="now-showing">
                                        <i class="fa-solid fa-plus"></i>
                                    </div>
                                </div>
                            </section>

                            <!-- Coming Soon Section -->
                            <section id="coming-soon">
                                <h2>Coming Soon Movies</h2>
                                <div class="movie-gallery">
                                    <!-- Plus Icon for Adding Movies -->
                                    <div class="add-movie-card" data-modal="coming-soon">
                                        <i class="fa-solid fa-plus"></i>
                                    </div>
                                </div>
                            </section>
                        </main>

                        <!-- Add Movie Modal -->
                        <div id="add-movie-modal" class="modal">
                            <div class="modal-content">
                                <h3>Add New Movie</h3>
                                <form id="add-movie-form">
                                    <input type="text" id="movie-name" name="movie-name" placeholder="Movie Name" required>
                                    <input type="text" id="language" name="language" placeholder="Language" required>
                                    <input type="text" id="genre" name="genre" placeholder="Genre" required>
                                    <input type="date" id="release-date" name="release-date" placeholder="Release Date">
                                    <input type="file" id="movie-image" name="movie-image" accept="image/*" required>
                                    <button type="submit" class="submit-btn">Add Movie</button>
                                    <button type="button" class="close-btn">Cancel</button>
                                </form>
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
        
        
        
        <!-- RESERVATIONS Section -->
        <a class="anchor" name="reservations"></a>
        <div class="row grid-responsive reservations">

        </div>
        
        
        
        
        
        <!-- PAYMENTS Section -->
        <a class="anchor" name="payments"></a>
        <div class="row grid-responsive payments">

        </div>
        
        
        
        
        
        <!-- FEEDBACK Section -->
        <a class="anchor" name="feedback"></a>
        <div class="row grid-responsive feedback">

        </div>
        
        
        
        
        
        
        <!-- INQUIRIES Section -->
        <a class="anchor" name="inquiries"></a>
        <div class="row grid-responsive inquiries">

        </div>
        
        
        
        
        
        
        <!-- USERS Section -->
        <a class="anchor" name="users"></a>
        <div class="row grid-responsive users">
            <div class="column">
                <div class="card">
                    <div class="card-title">
                        <h3>User Management</h3>
                    </div>
                    <div class="card-block">
                        <div class="admin-panel">
                            <div class="add-user-section">
                                <button class="add-user-btn">Add New User</button>
                            </div>

                            <!-- Add User Form -->
                            <div class="add-user-form">
                                <h3>Add New User</h3>
                                <input type="text" id="userId" placeholder="User ID">
                                <input type="text" id="userName" placeholder="User Name">
                                <input type="email" id="userEmail" placeholder="User Email">
                                <label for="userPhoto">Upload Photo:</label>
                                <input type="file" id="userPhoto" accept="image/*">
                                <button id="addUserSubmit">Add User</button>
                                <button class="clear-btn" id="clearForm">Clear</button>
                            </div>

                                <div class="table-wrapper">
                                    <table class="user-table">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Name</th>
                                                <th>Email</th>
                                                <th>Movies Booked</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody id="userTableBody">
                                            <!-- Example rows -->
                                            <tr>
                                                <td>1</td>
                                                <td><img src="https://via.placeholder.com/40" alt="Profile Pic" class="profile-pic"> John Doe</td>
                                                <td>johndoe@mail.com</td>
                                                <td>Avengers, Spider-Man</td>
                                                <td>
                                                    <button class="edit-btn"><i class="fa-solid fa-user-pen"></i></button>
                                                    <button class="delete-btn"><i class="fa-solid fa-trash"></i></button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
        
        
        
        <!-- MAIN-CAROUSEL Section -->
        <a class="anchor" name="main-carousel"></a>
        <div class="row grid-responsive main-carousel">

        </div>
        
        
        

        <!-- TESTIMONIALS Section -->
        <a class="anchor" name="testimonials"></a>
        <div class="row grid-responsive testimonials">
            <div class="column">
                <div class="card">
                    <div class="card-title">
                        <h3>Testimonials</h3>
                    </div>
                    <div class="card-block">
                        <div class="testimonial-items">
                            <!-- Testimonial 1 -->
                            <div class="testimonial">
                                <div class="testimonial-details">
                                    <div class="testimonial-image">
                                        <img src="path/to/testimonial1.jpg" alt="Testimonial Image 1">
                                    </div>
                                    <div class="testimonial-info">
                                        <input type="text" name="name" placeholder="Name" value="John Doe">
                                        <input type="text" name="occupation" placeholder="Occupation" value="Software Engineer">
                                        <textarea name="quote" placeholder="Quote">This is an amazing service!</textarea>
                                    </div>
                                </div>
                                <div class="testimonial-actions">
                                    <button class="updateBtn button-outline" data-item-id="1">
                                        <i class="fa fa-edit fa-lg"></i>
                                    </button>
                                    <button class="deleteBtn button-outline" data-item-id="1">
                                        <i class="fa fa-trash fa-lg"></i>
                                    </button>
                                </div>
                            </div>
                            <!-- Testimonial 2 -->
                            <div class="testimonial">
                                <div class="testimonial-details">
                                    <div class="testimonial-image">
                                        <img src="path/to/testimonial2.jpg" alt="Testimonial Image 2">
                                    </div>
                                    <div class="testimonial-info">
                                        <input type="text" name="name" placeholder="Name" value="Jane Smith">
                                        <input type="text" name="occupation" placeholder="Occupation" value="Graphic Designer">
                                        <textarea name="quote" placeholder="Quote">Highly recommended!</textarea>
                                    </div>
                                </div>
                                <div class="testimonial-actions">
                                    <button class="updateBtn button-outline" data-item-id="2">
                                        <i class="fa fa-edit fa-lg"></i>
                                    </button>
                                    <button class="deleteBtn button-outline" data-item-id="2">
                                        <i class="fa fa-trash fa-lg"></i>
                                    </button>
                                </div>
                            </div>
                            <!-- New testimonial form -->
                            <div class="testimonial new-testimonial">
                                <div class="testimonial-details">
                                    <div class="testimonial-image" id="imageUrlInput6">
                                        <img src="path/to/placeholder-image.jpg" alt="Testimonial Image">
                                        <input type="file" id="fileInput6" style="display: none;" accept="image/*">
                                    </div>
                                    <div class="testimonial-info">
                                        <input type="text" name="name" placeholder="Name">
                                        <input type="text" name="occupation" placeholder="Occupation">
                                        <textarea name="quote" placeholder="Quote"></textarea>
                                    </div>
                                </div>
                                <div class="testimonial-actions">
                                    <button id="addItem">Add <i class="fa fa-plus fa-lg"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        
        <!-- GALLERY Section -->
        <a class="anchor" name="gallery"></a>
        <div class="row grid-responsive gallery">
            <div class="column">
                <div class="card">
                    <div class="card-title">
                        <h3>Gallery</h3>
                    </div>
                    <div class="card-block">
                        <div class="gallery-items">
                            <!-- Gallery item 1 -->
                            <div class="gallery-card" id="imageUrlInput51">
                                <img src="path/to/image1.jpg" alt="Gallery Image 1">
                                <input type="file" id="fileInput51" style="display: none;" accept="image/*" data-item-id="1">
                                <div class="gallery-actions">
                                    <button class="button-outline" id="uploadImage51">
                                        <i class="fa fa-cloud-upload fa-lg"></i>
                                    </button>
                                    <button class="deleteBtn button-outline" data-item-id="1">
                                        <i class="fa fa-trash fa-lg"></i>
                                    </button>
                                </div>
                            </div>
                            <!-- Gallery item 2 -->
                            <div class="gallery-card" id="imageUrlInput52">
                                <img src="path/to/image2.jpg" alt="Gallery Image 2">
                                <input type="file" id="fileInput52" style="display: none;" accept="image/*" data-item-id="2">
                                <div class="gallery-actions">
                                    <button class="button-outline" id="uploadImage52">
                                        <i class="fa fa-cloud-upload fa-lg"></i>
                                    </button>
                                    <button class="deleteBtn button-outline" data-item-id="2">
                                        <i class="fa fa-trash fa-lg"></i>
                                    </button>
                                </div>
                            </div>
                            <!-- New gallery item form -->
                            <div class="gallery-card new-gallery-item" id="imageUrlInput0000">
                                <img src="" alt="New Gallery Image" style="display: none;">
                                <input type="file" id="fileInput0000" style="display: none;" accept="image/*" data-item-id="new-gallery-item">
                                <button class="button" id="uploadImage0000">
                                    Add <i class="fa fa-plus fa-lg"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
    <!-- Footer -->
    <footer>
        <div id="#log-reg-footer">
                <p class="credit">Powered by <a href="<?php echo $site ?>" target="_blank">ABC CINEMA</a></p>
        </div>
    </footer>        
        
</section>

</div>

<!-- Footer -->
<jsp:include page="temps/adminFooter.jsp" />
