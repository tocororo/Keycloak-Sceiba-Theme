<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm'); section>
<div class="flex-center wrap"> 
    <#if section = "header">
        
    <#elseif section = "form">
        <div class="mdc-card" style="margin-top: 2em">
            <div id="kc-form" class="mdc-card-wrapper__text-section">
                <span class="mdc-typography mdc-typography--headline6">${msg("registerTitle")}</span>
            </div>
            <form id="kc-register-form" class="mdc-card-wrapper__text-section ${properties.kcFormClass!}" action="${url.registrationAction}" method="post">
                
                <div class="text-field-container ${properties.kcFormGroupClass!}">
                    <div class="mdc-text-field text-field mdc-text-field--outlined mdc-text-field-100 ${properties.kcFormGroupClass!}">
                        <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                            <div class="mdc-notched-outline__leading"></div>
                            <div class="mdc-notched-outline__notch ${properties.kcLabelWrapperClass!}">
                                <label for="firstName" class="mdc-floating-label ${properties.kcLabelClass!}">${msg("firstName")}</label>
                            </div>
                            <div class="mdc-notched-outline__trailing"></div>
                        </div>
                        <input type="text" id="firstName" class="mdc-text-field__input ${properties.kcInputClass!}" name="firstName"
                            value="${(register.formData.firstName!'')}"
                            aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>"
                        />
                    </div>
                    <#if messagesPerField.existsError('firstName')>
                        <div class="mdc-text-field-helper-line">
                            <span id="input-error" class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg mdc-text-field-error ${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('firstName'))?no_esc}
                            </span>
                        </div>
                    </#if>
                </div>

                <div class="text-field-container ${properties.kcFormGroupClass!}">
                    <div class="mdc-text-field text-field mdc-text-field--outlined mdc-text-field-100 ${properties.kcFormGroupClass!}">
                        <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                            <div class="mdc-notched-outline__leading"></div>
                            <div class="mdc-notched-outline__notch ${properties.kcLabelWrapperClass!}">
                                <label for="lastName" class="mdc-floating-label ${properties.kcLabelClass!}">${msg("lastName")}</label>
                            </div>
                            <div class="mdc-notched-outline__trailing"></div>
                        </div>
                        <input type="text" id="lastName" class="mdc-text-field__input ${properties.kcInputClass!}" name="lastName"
                            value="${(register.formData.lastName!'')}"
                            aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>"
                        />
                    </div>
                    <#if messagesPerField.existsError('lastName')>
                        <div class="mdc-text-field-helper-line">
                            <span id="input-error" class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg mdc-text-field-error ${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('lastName'))?no_esc}
                            </span>
                        </div>
                    </#if>
                </div>

                <div class="text-field-container ${properties.kcFormGroupClass!}">
                    <div class="mdc-text-field text-field mdc-text-field--outlined mdc-text-field-100 ${properties.kcFormGroupClass!}">
                        <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                            <div class="mdc-notched-outline__leading"></div>
                            <div class="mdc-notched-outline__notch ${properties.kcLabelWrapperClass!}">
                                <label for="email" class="mdc-floating-label ${properties.kcLabelClass!}">${msg("email")}</label>
                            </div>
                            <div class="mdc-notched-outline__trailing"></div>
                        </div>
                        <input type="text" id="email" class="mdc-text-field__input ${properties.kcInputClass!}" name="email"
                            value="${(register.formData.email!'')}"
                            aria-invalid="<#if messagesPerField.existsError('email')>true</#if>"
                        />
                    </div>
                    <#if messagesPerField.existsError('email')>
                        <div class="mdc-text-field-helper-line">
                            <span id="input-error" class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg mdc-text-field-error ${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('email'))?no_esc}
                            </span>
                        </div>
                    </#if>
                </div>

                <#if !realm.registrationEmailAsUsername>
                    <div class="text-field-container ${properties.kcFormGroupClass!}">
                        <div class="mdc-text-field text-field mdc-text-field--outlined mdc-text-field-100 ${properties.kcFormGroupClass!}">
                            <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                                <div class="mdc-notched-outline__leading"></div>
                                <div class="mdc-notched-outline__notch ${properties.kcLabelWrapperClass!}">
                                    <label for="username" class="mdc-floating-label ${properties.kcLabelClass!}">${msg("username")}</label>
                                </div>
                                <div class="mdc-notched-outline__trailing"></div>
                            </div>
                            <input type="text" id="username" class="mdc-text-field__input ${properties.kcInputClass!}" name="username"
                                value="${(register.formData.username!'')}"
                                aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                            />
                        </div>
                        <#if messagesPerField.existsError('username')>
                            <div class="mdc-text-field-helper-line">
                                <span id="input-error" class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg mdc-text-field-error ${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                        ${kcSanitize(messagesPerField.get('username'))?no_esc}
                                </span>
                            </div>
                        </#if>

                            <#--  <#if messagesPerField.existsError('username')>
                                <span id="input-error-username" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('username'))?no_esc}
                                </span>
                            </#if>
                        </div>  -->
                    </div>
                </#if>

                <#if passwordRequired??>
                    <div class="text-field-container ${properties.kcFormGroupClass!}">
                        <div class="mdc-text-field text-field mdc-text-field--outlined mdc-text-field-100 ${properties.kcFormGroupClass!}">
                            <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                                <div class="mdc-notched-outline__leading"></div>
                                <div class="mdc-notched-outline__notch ${properties.kcLabelWrapperClass!}">
                                    <label for="password" class="mdc-floating-label ${properties.kcLabelClass!}">${msg("password")}</label>
                                </div>
                                <div class="mdc-notched-outline__trailing"></div>
                            </div>
                            <input type="password" id="password" class="mdc-text-field__input ${properties.kcInputClass!}" name="password"
                                value="${(register.formData.password!'')}"
                                aria-invalid="<#if messagesPerField.existsError('password')>true</#if>"
                            />
                        </div>
                        <#if messagesPerField.existsError('password')>
                            <div class="mdc-text-field-helper-line">
                                <span id="input-error" class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg mdc-text-field-error ${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                        ${kcSanitize(messagesPerField.get('password'))?no_esc}
                                </span>
                            </div>
                        </#if>

                            <#--  <#if messagesPerField.existsError('password')>
                                <span id="input-error-password" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('password'))?no_esc}
                                </span>
                            </#if>
                        </div>  -->
                    </div>
                    <div class="text-field-container ${properties.kcFormGroupClass!}">
                        <div class="mdc-text-field text-field mdc-text-field--outlined mdc-text-field-100 ${properties.kcFormGroupClass!}">
                            <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                                <div class="mdc-notched-outline__leading"></div>
                                <div class="mdc-notched-outline__notch ${properties.kcLabelWrapperClass!}">
                                    <label for="password-confirm" class="mdc-floating-label ${properties.kcLabelClass!}">${msg("passwordConfirm")}</label>
                                </div>
                                <div class="mdc-notched-outline__trailing"></div>
                            </div>
                            <input type="password" id="password-confirm" class="mdc-text-field__input ${properties.kcInputClass!}" name="password-confirm"
                                aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                            />
                        </div>
                        <#if messagesPerField.existsError('password-confirm')>
                            <div class="mdc-text-field-helper-line">
                                <span id="input-error" class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg mdc-text-field-error ${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                        ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                                </span>
                            </div>
                        </#if>
                    <#--  <div class="${properties.kcFormGroupClass!}">
                        <div class="${properties.kcLabelWrapperClass!}">
                            <label for="password-confirm"
                                class="${properties.kcLabelClass!}">${msg("passwordConfirm")}</label>
                        </div>
                        <div class="${properties.kcInputWrapperClass!}">
                            <input type="password" id="password-confirm" class="${properties.kcInputClass!}"
                                name="password-confirm"
                                aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                            />

                            <#if messagesPerField.existsError('password-confirm')>
                                <span id="input-error-password-confirm" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                                </span>
                            </#if>
                        </div>  -->
                    </div>
                </#if>

                <#if recaptchaRequired??>
                    <div class="form-group">
                        <div class="${properties.kcInputWrapperClass!}">
                            <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                        </div>
                    </div>
                </#if>

                <div class="flex-between wrap ${properties.kcFormGroupClass!}">
                    <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                        <div class="${properties.kcFormOptionsWrapperClass!}">
                            <a href="${url.loginUrl}" class="mdc-button">  <span class="mdc-button__ripple"></span> ${kcSanitize(msg("backToLogin"))?no_esc}</a>
                        </div>
                    </div>

                    <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                        <button class="mdc-button  mdc-button--unelevated ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit">
                            <span class="mdc-button__ripple"></span> ${msg("doRegister")}
                        </button>
                        <#--  <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doRegister")}"/>  -->
                    </div>
                </div>
            </form>
        </div>
    </#if>
</@layout.registrationLayout>
</div>