<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
<div class="flex-center wrap">   
        <#if section = "header">
            
        <#elseif section = "form">
            <div class="mdc-card" style="margin-top: 2em">
            <div id="kc-form" class="mdc-card-wrapper__text-section">
                <span class="mdc-typography mdc-typography--headline6">${msg("loginAccountTitle")}</span>
            </div>
                <div id="kc-form" class="mdc-card-wrapper__text-section">
                <div id="kc-form-wrapper">
                    <#if realm.password>
                        <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                            <#--  Username or email field  -->
                            <div class="text-field-container">
                                <div class="mdc-text-field text-field mdc-text-field--outlined mdc-text-field-100 ${properties.kcFormGroupClass!}">
                                    <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                                        <div class="mdc-notched-outline__leading"></div>
                                        <div class="mdc-notched-outline__notch">
                                            <label for="username" class="mdc-floating-label ${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
                                        </div>
                                        <div class="mdc-notched-outline__trailing"></div>
                                    </div>

                                    <#if usernameEditDisabled??>
                                        <input tabindex="1" id="username" class="mdc-text-field__input ${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" disabled />
                                    <#else>
                                        <input tabindex="1" id="username" class="mdc-text-field__input ${properties.kcInputClass!}" name="username" value="${(login.username!'')}"  type="text" autofocus autocomplete="off"
                                            aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                                        />
                                        <#--  poner los estilos para cuando los datos son erroneos  -->
                                </div>
                                        <#if messagesPerField.existsError('username','password')>
                                            <div class="mdc-text-field-helper-line">
                                                <span id="input-error" class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg mdc-text-field-error ${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                                        ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                                                </span>
                                            </div>
                                        </#if>
                                    </#if>
                                <#--  </div>  -->
                            </div>
                            <#--  End Username or email field  -->
                            <#--  Password field  -->
                            <div class="text-field-container">
                                <div class="mdc-text-field mdc-text-field--outlined mdc-text-field-100 ${properties.kcFormGroupClass!}">
                                    <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                                        <div class="mdc-notched-outline__leading"></div>
                                        <div class="mdc-notched-outline__notch">
                                            <label for="password" class="mdc-floating-label ${properties.kcLabelClass!}">${msg("password")}</label>
                                        </div>
                                        <div class="mdc-notched-outline__trailing"></div>
                                    </div>
                                    <input tabindex="2" id="password" class="mdc-text-field__input ${properties.kcInputClass!}" name="password" type="password" autocomplete="off"
                                        aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                                    />
                                </div>
                            </div>
                            <#--  End Password field  -->

                            <#--  Remember Me field  -->
                            <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                                <div id="kc-form-options">
                                    <#if realm.rememberMe && !usernameEditDisabled??>
                                        <div class="mdc-form-field">
                                            <div class="mdc-checkbox">
                                                <#if login.rememberMe??>
                                                    <input class="mdc-checkbox__native-control" tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked>
                                                <#else>
                                                    <input class="mdc-checkbox__native-control" tabindex="3" id="rememberMe" name="rememberMe" type="checkbox">
                                                </#if>
                                                <div class="mdc-checkbox__background">
                                                    <svg class="mdc-checkbox__checkmark"
                                                        viewBox="0 0 24 24">
                                                        <path class="mdc-checkbox__checkmark-path"
                                                            fill="none"
                                                            d="M1.73,12.91 8.1,19.28 22.79,4.59"/>
                                                    </svg>
                                                    <div class="mdc-checkbox__mixedmark"></div>
                                                </div>
                                                <div class="mdc-checkbox__ripple"></div>
                                            </div>
                                            <label for="rememberMe">${msg("rememberMe")}</label>
                                        </div>
                                        
                                    </#if>
                                </div>

                            </div>
                            <#--  Remember Me field  -->

                            <#--  Login Button  -->
                            <div id="kc-form-buttons" class="mdc-card__actions ${properties.kcFormGroupClass!}">
                                <div class="mdc-card__action-buttons">
                                    <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                                    <button tabindex="4" class="mdc-button  mdc-button--unelevated ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" name="login" id="kc-login" type="submit">
                                        <span class="mdc-button__ripple"></span> ${msg("doLogIn")}
                                    </button>
                                </div>
                            </div>
                            <#--  Login Button  -->
                        </form>
                    </#if>
                </div>

                <#if realm.password && social.providers??>
                    <div id="kc-social-providers" class="${properties.kcFormSocialAccountSectionClass!}">
                        <hr/>
                        <h4>${msg("identity-provider-login-label")}</h4>

                        <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountListGridClass!}</#if>">
                            <#list social.providers as p>
                                <a id="social-${p.alias}" class="${properties.kcFormSocialAccountListButtonClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountGridItem!}</#if>"
                                        type="button" href="${p.loginUrl}">
                                    <#if p.iconClasses?has_content>
                                        <i class="${properties.kcCommonLogoIdP!} ${p.iconClasses!}" aria-hidden="true"></i>
                                        <span class="${properties.kcFormSocialAccountNameClass!} kc-social-icon-text">${p.displayName!}</span>
                                    <#else>
                                        <span class="${properties.kcFormSocialAccountNameClass!}">${p.displayName!}</span>
                                    </#if>
                                </a>
                            </#list>
                        </ul>
                    </div>
                </#if>

            </div>
        <#elseif section = "info" >
        <hr>
            <div class="mr ${properties.kcFormOptionsWrapperClass!}">
                <#if realm.resetPasswordAllowed>
                    <a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a>
                </#if>
            </div>
            <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                <div class="ml" id="kc-registration-container">
                    <div id="kc-registration">
                        <#--  <span>${msg("noAccount")}   -->
                        <a tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a>
                        <#--  </span>  -->
                    </div>
                </div>
            </#if>
        </#if>

</@layout.registrationLayout>
</div>
