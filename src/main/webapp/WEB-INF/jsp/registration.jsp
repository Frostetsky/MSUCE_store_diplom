
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<tn:styles/>
<body id="page-top">
<tn:navi title="Hardware store"/>

<section class="page-section">
</section>
<section class="page-section" id="contact">
    <div class="container">
        <!-- Contact Section Heading-->
        <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">Register</h2>
        <!-- Icon Divider-->
        <div class="divider-custom">
            <div class="divider-custom-line"></div>
            <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
            <div class="divider-custom-line"></div>
        </div>
        <!-- Contact Section Form-->
        <div class="row">
            <div class="col-lg-8 mx-auto">
                <form:form method="POST" modelAttribute="userForm" id="contactForm" name="sentMessage">
                <div class="control-group">
                    <div class="form-group floating-label-form-group controls mb-0 pb-2">
                        <label>Company name</label>
                        <form:input type="text" path="companyName" placeholder="Company name" id="name" required="required" data-validation-required-message="Please enter your company name."
                                    autofocus="true"></form:input>
                    <p class="help-block text-danger"><form:errors path="companyName"></form:errors></p>
                </div>
            </div>
                    <div class="control-group">
                        <div class="form-group floating-label-form-group controls mb-0 pb-2">
                            <label>Contact</label>
                            <form:input type="text" path="contact" placeholder="Contact" id="contact" required="required" data-validation-required-message="Please enter your contact."
                                        autofocus="true"></form:input>
                            <p class="help-block text-danger"><form:errors path="contact"></form:errors></p>
                        </div>
                    </div>
            <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                    <label>Username</label>
                    <form:input type="text" path="username" placeholder="Username" id="username" required="required" data-validation-required-message="Please enter your name."
                                autofocus="true"></form:input>
                    <p class="help-block text-danger"><form:errors path="username"></form:errors>${usernameError}</p>
                </div>
            </div>
            <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                    <label>Password</label>
                    <form:input type="password" path="password" placeholder="Password" id="message" required="required" data-validation-required-message="Please enter your password."
                                autofocus="true"></form:input>
                    <p class="help-block text-danger"><form:errors path="password"></form:errors></p>
                </div>
            </div>
            <br />
            <div id="success"></div>
            <div class="form-group">
                <button class="btn btn-primary btn-xl" id="sendMessageButton" type="submit">Sign Up</button>
            </div>
            </form:form>
        </div>
    </div>
    </div>
</section>

<tn:footer></tn:footer>
</body>
</html>
