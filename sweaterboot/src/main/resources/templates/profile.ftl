
<#import "parts/common.ftl" as c>

<@c.page>

<form  method="post" >


        <div class="form-group">
            <label class="col-sm-2 col-form-label"> Email </label>
            <div class="col-sm-4">
                <input type="email" name="email" class="form-control" placeholder="some@some.com" value="${email!''}"/>
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
    <div class="form-group">
        <label class="col-sm-2 col-form-label"> Повторите пароль: </label>
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
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <button type="submit" class="btn btn-primary">Save</button>
</form>

</@c.page>