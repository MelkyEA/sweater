<#import "parts/common.ftl" as c>

<@c.page>
<div class="form-row">
    <div class="form-group col-md-6">
        <form method="get" action="/main" class="form-inline">


            <input type="text" name="filter" value="${filter!}" class="form-control"    placeholder="Фильтр"/>
            <button type="submit" class="btn btn-primary ml-2">Найти</button>
        </form>
    </div>
</div>
<#assign
add=true
>
<#include "parts/messageEdit.ftl"/>
<#include "parts/messageList.ftl"/>
</@c.page>