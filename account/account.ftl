<#import "template.ftl" as layout>
<@layout.mainLayout active='account' bodyClass='user'; section>

    <div class="w-3">
        <div class="col-md-10">
            <span class="mdc-typography mdc-typography--headline4">${msg("editAccountHtmlTitle")}</span>
        </div>
        <div class="col-md-2 subtitle">
            <span class="mdc-typography mdc-typography--subtitle2"><span class="required">*</span> ${msg("requiredFields")}</span>
        </div>
    </div>

    <form action="${url.accountUrl}" class="form-horizontal" method="post">

        <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">

        <#if !realm.registrationEmailAsUsername>
            <#--  <div class="form-group ${messagesPerField.printIfExists('username','has-error')}">
                <div class="col-sm-2 col-md-2">
                    <label for="username" class="control-label">${msg("username")}</label> <#if realm.editUsernameAllowed><span class="required">*</span></#if>
                </div>

                <div class="col-sm-10 col-md-10">
                    <input type="text" class="form-control" id="username" name="username" <#if !realm.editUsernameAllowed>disabled="disabled"</#if> value="${(account.username!'')}"/>
                </div>
            </div>  -->
            <#--  Username field  -->
            <div class="text-field-container">
                <div class="mdc-text-field mdc-text-field--outlined mdc-text-field-100 ${properties.kcFormGroupClass!}">
                    <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                        <div class="mdc-notched-outline__leading"></div>
                        <div class="mdc-notched-outline__notch">
                            <label for="username" class="mdc-floating-label">${msg("username")} <#if realm.editUsernameAllowed><span class="required">*</span></#if></label>
                        </div>
                        <div class="mdc-notched-outline__trailing"></div>
                    </div>
                    <input tabindex="2" type="text" class="mdc-text-field__input" id="username" name="username" autocomplete="off" aria-invalid="<#if messagesPerField.existsError('username')>true</#if>" <#if !realm.editUsernameAllowed>disabled="disabled"</#if> value="${(account.username!'')}"/>
                </div>
                <#if messagesPerField.existsError('username')>
                    <div class="mdc-text-field-helper-line">
                        <span id="input-error" class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg mdc-text-field-error" aria-live="polite">
                                ${kcSanitize(messagesPerField.getFirstError('username'))?no_esc}
                        </span>
                    </div>
                </#if>
            </div>
            <#--  End Username field  -->
        </#if>

        <#--  Email field  -->
        <div class="text-field-container">
            <div class="mdc-text-field mdc-text-field--outlined mdc-text-field-100 ${properties.kcFormGroupClass!}">
                <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                    <div class="mdc-notched-outline__leading"></div>
                    <div class="mdc-notched-outline__notch">
                        <label for="email" class="mdc-floating-label">${msg("email")} <span class="required">*</span></label>
                    </div>
                    <div class="mdc-notched-outline__trailing"></div>
                </div>
                <input tabindex="2" type="text" class="mdc-text-field__input" id="email" name="email" autocomplete="off" aria-invalid="<#if messagesPerField.existsError('email')>true</#if>" value="${(account.email!'')}"/>
            </div>
            <#if messagesPerField.existsError('email')>
                <div class="mdc-text-field-helper-line">
                    <span id="input-error" class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg mdc-text-field-error" aria-live="polite">
                            ${kcSanitize(messagesPerField.getFirstError('email'))?no_esc}
                    </span>
                </div>
            </#if>
        </div>
        <#--  End Email field  -->

        <#--  <div class="form-group ${messagesPerField.printIfExists('firstName','has-error')}">
            <div class="col-sm-2 col-md-2">
                <label for="firstName" class="control-label">${msg("firstName")}</label> <span class="required">*</span>
            </div>

            <div class="col-sm-10 col-md-10">
                <input type="text" class="form-control" id="firstName" name="firstName" value="${(account.firstName!'')}"/>
            </div>
        </div>  -->

        <#--  firstName field  -->
        <div class="text-field-container">
            <div class="mdc-text-field mdc-text-field--outlined mdc-text-field-100 ${properties.kcFormGroupClass!}">
                <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                    <div class="mdc-notched-outline__leading"></div>
                    <div class="mdc-notched-outline__notch">
                        <label for="firstName" class="mdc-floating-label">${msg("firstName")} <span class="required">*</span></label>
                    </div>
                    <div class="mdc-notched-outline__trailing"></div>
                </div>
                <input tabindex="2" type="text" class="mdc-text-field__input" id="firstName" name="firstName" autocomplete="off" aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>" value="${(account.firstName!'')}"/>
            </div>
            <#if messagesPerField.existsError('firstName')>
                <div class="mdc-text-field-helper-line">
                    <span id="input-error" class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg mdc-text-field-error" aria-live="polite">
                            ${kcSanitize(messagesPerField.getFirstError('firstName'))?no_esc}
                    </span>
                </div>
            </#if>
        </div>
        <#--  End firstName field  -->

        <#--  lastName field  -->
        <div class="text-field-container">
            <div class="mdc-text-field mdc-text-field--outlined mdc-text-field-100 ${properties.kcFormGroupClass!}">
                <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                    <div class="mdc-notched-outline__leading"></div>
                    <div class="mdc-notched-outline__notch">
                        <label for="lastName" class="mdc-floating-label">${msg("lastName")} <span class="required">*</span></label>
                    </div>
                    <div class="mdc-notched-outline__trailing"></div>
                </div>
                <input tabindex="2" type="text" class="mdc-text-field__input" id="lastName" name="lastName" autocomplete="off" aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>" value="${(account.lastName!'')}"/>
            </div>
            <#if messagesPerField.existsError('lastName')>
                <div class="mdc-text-field-helper-line">
                    <span id="input-error" class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg mdc-text-field-error" aria-live="polite">
                            ${kcSanitize(messagesPerField.getFirstError('lastName'))?no_esc}
                    </span>
                </div>
            </#if>
        </div>
        <#--  End lastName field  -->

        <div class="form-group">
            <div id="kc-form-buttons" class="col-md-offset-2 col-md-10 submit">
                <div class="">
                    <#if url.referrerURI??><a href="${url.referrerURI}">${kcSanitize(msg("backToApplication")?no_esc)}</a></#if>
                    <button type="submit" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" name="submitAction" value="Save">${msg("doSave")}</button>
                    <button type="submit" class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!}" name="submitAction" value="Cancel">${msg("doCancel")}</button>
                </div>
            </div>
        </div>
    </form>

</@layout.mainLayout>
