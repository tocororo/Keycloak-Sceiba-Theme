<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true displayMessage=!messagesPerField.existsError('username'); section>
<div class="flex-center wrap"> 
    <#if section = "header">
        
    <#elseif section = "form">
        <div class="mdc-card" style="margin-top: 2em">
            <div id="kc-form" class="mdc-card-wrapper__text-section">
                <span class="mdc-typography mdc-typography--headline6">${msg("emailForgotTitle")}</span>
            </div>
            <div class="mdc-typography-color mdc-typography mdc-typography--body2">
                ${msg("emailInstruction")}
            </div>
            <form id="kc-reset-password-form" class="mdc-card-wrapper__text-section ${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                <div class="text-field-container ${properties.kcFormGroupClass!}">
                    <div class="mdc-text-field text-field mdc-text-field--outlined mdc-text-field-100 ${properties.kcFormGroupClass!}">
                        <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                            <div class="mdc-notched-outline__leading"></div>
                            <div class="mdc-notched-outline__notch ${properties.kcLabelWrapperClass!}">
                                <label for="username" class="mdc-floating-label ${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
                            </div>
                            <div class="mdc-notched-outline__trailing"></div>
                        </div>
                        <#if auth?has_content && auth.showUsername()>
                            <input type="text" id="username" name="username" class="mdc-text-field__input ${properties.kcInputClass!}" autofocus value="${auth.attemptedUsername}" aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"/>
                        <#else>
                            <input type="text" id="username" name="username" class="mdc-text-field__input ${properties.kcInputClass!}" autofocus aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"/>
                        </#if>
                    </div>
                    <#if messagesPerField.existsError('username')>
                        <div class="mdc-text-field-helper-line">
                            <span id="input-error" class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg mdc-text-field-error ${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('username'))?no_esc}
                            </span>
                        </div>
                    </#if>
                </div>
                
                <div class="flex-between wrap ${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                    <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                        <div class="${properties.kcFormOptionsWrapperClass!}">
                            <a href="${url.loginUrl}" class="mdc-button">  <span class="mdc-button__ripple"></span> ${kcSanitize(msg("backToLogin"))?no_esc}</a>
                            <#--  <span><a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>  -->
                        </div>
                    </div>

                    <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                        <button class="mdc-button  mdc-button--unelevated ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit">
                            <span class="mdc-button__ripple"></span> ${msg("doSubmit")}
                        </button>
                    </div>
                </div>
            </form>
        </div>
    <#elseif section = "info" >

    </#if>
</@layout.registrationLayout>
</div>