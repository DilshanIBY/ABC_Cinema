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
        <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie Admin Panel</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
   
        <a class="anchor" name="movies"></a>
        <div class="row grid-responsive movies">
            <div class="admin-panel">
        <header>
            <h1>Movie Management</h1>
        </header>
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
  <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - User Section</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <a class="anchor" name="users"></a>
        <div class="row grid-responsive users">
           <div class="admin-dashboard">
        <header class="dashboard-header">
            <h1>User Management</h1>
        </header>
        
        <div class="add-user-section">
            <h2>Registered Users</h2>
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

        <section class="user-table-section">
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
        </section>
    </div>
        </div>
        
        
        
        
        
        
        
        <!-- MAIN-CAROUSEL Section -->
        <a class="anchor" name="main-carousel"></a>
        <div class="row grid-responsive main-carousel">

        </div>
        
        
        
        
        
        
        <!-- MINI-CAROUSEL Section -->
        <a class="anchor" name="mini-carousel"></a>
        <div class="row grid-responsive mini-carousel">

        </div>
        
        
        
        
        
        
        <!-- TESTIMONIALS Section -->
        <a class="anchor" name="testimonials"></a>
        <div class="row grid-responsive testimonials">

        </div>
        
        
        
        
        
        
        <!-- GALLERY Section -->
        <a class="anchor" name="gallery"></a>
        <div class="row grid-responsive gallery">

        </div>

        
        
        
        
        
</section>

</div>

<!-- Footer -->
<jsp:include page="temps/adminFooter.jsp" />
