
<a class="btn btn-primary" data-toggle="collapse" href="#AddMessage" role="button" aria-expanded="false" aria-controls="collapseExample">
    Редактировать сообщение
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
    <label class="custom-file-label" for="customFile">Choose file</label>
</div>
<input type="hidden" name="_csrf" value="${_csrf.token}">
<input type="hidden" name="id" value="<#if message??>${message.id}</#if>">
<div class="form-group mt-3">
    <button type="submit" class="btn btn-primary">Сохранить</button>
</div>
</form>
</div>

</div>
<div class="card-columns">
    <#list messages as message>
    <div class="card my-3" style="width: 18rem;">

        <#if message.filename??>
        <img src="/img/${message.filename} " class="card-img-top">
    </#if>
    <div class="m-2"
    <span>${message.text}</span>
    <i>${message.tag}</i>
</div>
<div class="card-footer text-muted">
    ${message.authorName}
</div>

</div>
<#else>
No messages

</#list>
</div>