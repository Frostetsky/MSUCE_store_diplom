
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<tn:styles/>
<body id="page-top">
<tn:navi title="Welcome  ${currentUser.companyName} ( ${currentUser.username} )"/>

<section class="page-section">
</section>
<section class="page-section" id="contact">
    <div class="container">
        <!-- Contact Section Heading-->
        <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">Add product</h2>
        <!-- Icon Divider-->
        <div class="divider-custom">
            <div class="divider-custom-line"></div>
            <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
            <div class="divider-custom-line"></div>
        </div>
        <!-- Contact Section Form-->
        <div class="row">
            <div class="col-lg-8 mx-auto">
                <form:form method="POST" action="/admin/add"  modelAttribute="prodForm" id="contactForm" name="sentMessage">
                    <div class="control-group">
                        <div class="form-group floating-label-form-group controls mb-0 pb-2">
                            <label>Product name</label>
                            <form:input type="text" path="name" placeholder="Name" id="name" required="required" data-validation-required-message="Please enter your product name."
                                        autofocus="true"></form:input>
                            <p class="help-block text-danger"><form:errors path="name"></form:errors>${nameError}</p>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="form-group floating-label-form-group controls mb-0 pb-2">
                            <label>StockLevel</label>
                            <form:input type="number" path="stockLevel" placeholder="StockLevel" id="stockLevel" required="required" data-validation-required-message="Please enter your product stockLevel."
                                        autofocus="true"></form:input>
                            <p class="help-block text-danger"><form:errors path="stockLevel"></form:errors>${usernameError}</p>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="form-group floating-label-form-group controls mb-0 pb-2">
                            <label>Image</label>
                            <form:input type="text" path="image" placeholder="Url" id="image" required="required" data-validation-required-message="Please enter your product image."
                                        autofocus="true"></form:input>
                            <p class="help-block text-danger"><form:errors path="image"></form:errors></p>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="form-group floating-label-form-group controls mb-0 pb-2">
                            <label>Description</label>
                            <form:textarea type="text" path="description" placeholder="Description" id="description" required="required" data-validation-required-message="Please enter your product description."
                                        autofocus="true"></form:textarea>
                            <p class="help-block text-danger"><form:errors path="description"></form:errors></p>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="form-group floating-label-form-group controls mb-0 pb-2">
                            <label>Price</label>
                            <form:input type="text" path="price" placeholder="Price" id="price" required="required" data-validation-required-message="Please enter your product price."
                                        autofocus="true"></form:input>
                            <p class="help-block text-danger"><form:errors path="price"></form:errors></p>
                        </div>
                    </div>
                    <br />
                    <div id="success"></div>
                    <div class="form-group">
                        <button class="btn btn-primary btn-xl" id="sendMessageButton" type="submit">Add</button>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</section>
<c:if test="${ not empty currentUser.products}">

    <section class="page-section portfolio" id="portfolio">
        <div class="container">
            <!-- Portfolio Section Heading-->
            <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">My products</h2>
            <!-- Icon Divider-->
            <div class="divider-custom">
                <div class="divider-custom-line"></div>
                <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                <div class="divider-custom-line"></div>
            </div>
            <!-- Portfolio Grid Items-->
            <div class="row justify-content-center">
                <c:forEach items="${currentUser.products}" var="product">
                <div class="col-md-6 col-lg-4 mb-5">
                    <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal1">
                        <img class="img-fluid" src="${product.image}" alt="${product.description}" />
                            <p class="lead">Name: ${product.name}</p>
                            <p class="lead">Description: ${product.description}</p>
                            <p class="lead">StockLevel: ${product.stockLevel}</p>
                            <p class="lead">Price: <font color="red">${product.price}</font></p>
                        <div class="text-center mt-4">
                            <a class="btn btn-xl btn-outline-light" href="${pageContext.request.contextPath}/admin/delete/${product.id_product}">
                                <i class="fas fa-download mr-2"></i>
                                Delete
                            </a>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </section>
</c:if>
<tn:footer></tn:footer>
</body>
</html>
