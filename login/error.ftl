<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
<div class="flex-center wrap"> 
    <#if section = "header">
        
    <#elseif section = "form">
        <div class="mdc-card" style="margin-top: 2em">
            <div id="kc-form" class="mdc-card-wrapper__text-section">
                <span class="mdc-typography mdc-typography--headline6">${msg("errorTitle")}</span>
            </div>
            <div class="mdc-typography-color mdc-typography mdc-typography--body2">
                <div id="kc-error-message">
                    <p class="instruction">${message.summary?no_esc}</p>
                    <#if client?? && client.baseUrl?has_content>
                        <a id="backToApplication" href="${client.baseUrl}" class="mdc-button">  <span class="mdc-button__ripple"></span> ${kcSanitize(msg("backToApplication"))?no_esc}</a>
                    </#if>
                </div>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>
</div>