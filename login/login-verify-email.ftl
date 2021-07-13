<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>

    
    <#if section = "header">
        
    <#elseif section = "form">
    <div class="flex-center wrap"> 
        <div class="mdc-card" style="margin-top: 2em">
            <div id="kc-form" class="mdc-card-wrapper__text-section">
                <span class="mdc-typography mdc-typography--headline6">${msg("emailVerifyTitle")}</span>
            </div>
            <div class="mdc-typography-color mdc-typography mdc-typography--body2">
                <p class="instruction">${msg("emailVerifyInstruction1")}</p>
        
    <#elseif section = "info">
        <p class="instruction">
            ${msg("emailVerifyInstruction2")}
            <br/>
            <a href="${url.loginAction}" class="mdc-button"><span class="mdc-button__ripple"></span> ${msg("doClickHere")}</a> ${msg("emailVerifyInstruction3")}
        </p>
    </#if>
</@layout.registrationLayout>
<#-- close div  mdc-typography  -->
</div>
<#-- close div  mdc-card  -->
</div>
<#-- close div  flex-center  -->
</div>