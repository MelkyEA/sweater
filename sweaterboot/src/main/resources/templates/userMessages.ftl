<#import "parts/common.ftl" as c>

<@c.page>
<#if isCurrentUser>
<#assign
    add=false
    >
<#include "parts/messageEdit.ftl"/>
</#if>
<#include "parts/messageList.ftl"/>
</@c.page>