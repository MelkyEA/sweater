<#include "security.ftl">
<#macro login path isRegisterForm>
<form action="${path}" method="post" >

    <div class="form-group">
        <label class="col-sm-2 col-form-label"> Имя пользователя: </label>
        <div class="col-sm-4">
            <input type="text" name="username" class="form-control ${(usernameError??)?string('is-invalid', '')}" placeholder="Имя пользователя"
                   value="<#if user??>${user.username}</#if>"/>
            <#if usernameError??>
                <div class="invalid-feedback">
                ${usernameError}
                </div>
            </#if>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 col-form-label"> Пароль: </label>
        <div class="col-sm-4">
            <input type="password" name="password" class="form-control ${(passwordError??)?string('is-invalid', '')}" placeholder="Пароль"/>
            <#if passwordError??>
                <div class="invalid-feedback">
                ${passwordError}
                </div>
            </#if>
        </div>
    </div>
    <#if isRegisterForm>

        <div class="form-group">
            <label class="col-sm-2 col-form-label"> Password: </label>
            <div class="col-sm-4">
                <input type="password" name="password2" class="form-control ${(password2Error??)?string('is-invalid', '')}"
                       placeholder="Повторите пароль"/>
                <#if password2Error??>
                    <div class="invalid-feedback">
                    ${password2Error}
                    </div>
                </#if>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 col-form-label"> Email </label>
            <div class="col-sm-4">
                <input type="email" name="email" class="form-control ${(emailError??)?string('is-invalid', '')}"
                       placeholder="some@some.com" value="<#if user??>${user.email}</#if>"/>
                <#if emailError??>
                    <div class="invalid-feedback">
                    ${emailError}
                    </div>
                </#if>
            </div>
        </div>
    <div class="col-sm-4">
        <div class="g-recaptcha" data-sitekey="6Ld2gnEUAAAAAPmb6Q-tGJu_Dyl2hnCes4e9qNbs"></div>
        <#if captchaError??>
            <div class="alert alert-danger" role="alert">
            ${captchaError}
            </div>
        </#if>
    </div>
    </#if>

    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <#if !isRegisterForm>

        <a href="/registration">Регистрация</a></#if>
    <button type="submit" class="btn btn-primary"><#if isRegisterForm>Регистрация<#else>Войти</#if></button>
</form>
</#macro>


<#macro logout >
    <#if isActive>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">

        <button type="submit" class="btn btn-primary">Выйти</button>
    </form>
    <#else>
    <a class="btn btn-primary" href="/login" role="button">Войти</a>
    </#if>
</#macro>