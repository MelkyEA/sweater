<#include "security.ftl">
<a class="btn btn-primary" data-toggle="collapse" href="#AddMessage" role="button" aria-expanded="false"
   aria-controls="collapseExample"><#if add> Добавить сообщение<#else> Редактировать сообщение</#if>
</a>
<div class="collapse <#if message??>show</#if>" id="AddMessage">
    <div class="form-group mt-3">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input type="hidden" class="form-control "  name="_csrf" value="${_csrf.token}">
            </div>
            <div class="form-group">
                <input type="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                       value="<#if message??>${message.text}</#if>" name="text" placeholder="Введите сообщение" />
                <#if textError??>
                <div class="invalid-feedback">
                    ${textError}
                </div>
            </#if>
    </div>
    <div class="form-group">
        <input type="text" class="form-control" name="tag" placeholder="Тэг" value="<#if message??>${message.tag}</#if>"/>
        <#if tagError??>
        <div class="invalid-feedback">
            ${tagError}
        </div>
    </#if>
</div>
<div class="custom-file">
    <input type="file" class="custom-file-input" id="customFile" name="file">
    <label class="custom-file-label" for="customFile">Выбрать файл</label>
</div>
<input type="hidden" name="_csrf" value="${_csrf.token}">
<input type="hidden" name="id" value="<#if message??>${message.id}</#if>">
<div class="form-group mt-3">
    <button type="submit" class="btn btn-primary">Сохранить</button>
</div>
</form>
</div>

</div>
