<!DOCTYPE html>
<html lang="en">

<?php
    include ('header.php')
?>

<body>

    <?php
        include ('nav.php');
    ?>

    <!-- Contact Form -->
    <!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
    <div class="row">
        <div class="col-md-12 text-center form-signup">
            <h3>Lav en bruger</h3>
            <hr>
            <form name="sentMessage" id="contactForm" novalidate>
                <div class="control-group form-group">
                    <div class="controls">
                        <label>Fornavn:</label>
                        <input type="text" class="form-control" id="name" required data-validation-required-message="Please enter your name.">
                        <p class="help-block"></p>
                    </div>
                </div>
                <div class="control-group form-group">
                    <div class="controls">
                        <label>Efternavn:</label>
                        <input type="text" class="form-control" id="name" required data-validation-required-message="Please enter your name.">
                        <p class="help-block"></p>
                    </div>
                </div>
                <div class="control-group form-group">
                    <div class="controls">
                        <label>Email Adresse:</label>
                        <input type="email" class="form-control" id="email" required data-validation-required-message="Please enter your email address.">
                    </div>
                </div>
                <div class="control-group form-group">
                    <div class="controls">
                        <label>Telefon Nummer:</label>
                        <input type="tel" class="form-control" id="phone" required data-validation-required-message="Please enter your phone number.">
                    </div>
                </div>
                <div class="control-group form-group">
                    <div class="controls">
                        <label>By:</label>
                        <input type="email" class="form-control" id="email" required data-validation-required-message="Please enter your email address.">
                    </div>
                </div>
                <hr>
                <!-- For success/fail messages -->
                <button type="submit" class="btn btn-primary">Opret Bruger</button>
            </form>
        </div>
    </div>
        <!-- /.row -->
</body>