<#import "template.ftl" as layout>
<@layout.mainLayout active='password' bodyClass='password'; section>

    <div class="w-4">
        <h2 class="mdc-typography mdc-typography--headline4">${msg("changePasswordHtmlTitle")}</h2>
        <span class="mdc-typography mdc-typography--subtitle2">${msg("allFieldsRequired")}</span>
    </div>

    <form action="${url.passwordUrl}" class="form-horizontal w-4" method="post">
        <input type="text" id="username" name="username" value="${(account.username!'')}" autocomplete="username" readonly="readonly" style="display:none;">

        <#if password.passwordSet>
            <#--  password field  -->
            <div class="text-field-container">
                <div class="mdc-text-field mdc-text-field--outlined mdc-text-field-100 ${properties.kcFormGroupClass!}">
                    <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                        <div class="mdc-notched-outline__leading"></div>
                        <div class="mdc-notched-outline__notch">
                            <label for="password" class="mdc-floating-label">${msg("password")}</label>
                        </div>
                        <div class="mdc-notched-outline__trailing"></div>
                    </div>
                    <input tabindex="1" type="password" class="mdc-text-field__input" id="password" name="password" autofocus autocomplete="current-password"/>
                </div>
            </div>
            <#--  End password field  -->
        </#if>

        <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">

        <#--  password-new field  -->
        <div class="text-field-container">
            <div class="mdc-text-field mdc-text-field--outlined mdc-text-field-100 ${properties.kcFormGroupClass!}">
                <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                    <div class="mdc-notched-outline__leading"></div>
                    <div class="mdc-notched-outline__notch">
                        <label for="password-new" class="mdc-floating-label">${msg("passwordNew")}</label>
                    </div>
                    <div class="mdc-notched-outline__trailing"></div>
                </div>
                <input tabindex="2" type="password" class="mdc-text-field__input" id="password-new" name="password-new" autocomplete="password-new"/>
            </div>
        </div>
        <#--  End password-new field  -->

        <#--  password-confirm field  -->
        <div class="text-field-container">
            <div class="mdc-text-field mdc-text-field--outlined mdc-text-field-100 ${properties.kcFormGroupClass!}">
                <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                    <div class="mdc-notched-outline__leading"></div>
                    <div class="mdc-notched-outline__notch">
                        <label for="password-confirm" class="mdc-floating-label">${msg("passwordConfirm")}</label>
                    </div>
                    <div class="mdc-notched-outline__trailing"></div>
                </div>
                <input tabindex="3" type="password" class="mdc-text-field__input" id="password-confirm" name="password-confirm" autocomplete="new-password"/>
            </div>
        </div>
        <#--  End password-confirm field  -->

        <div class="form-group">
            <div id="kc-form-buttons" class="col-md-offset-2 col-md-10 submit">
                <div class="">
                    <button type="submit" class="mdc-button mdc-button--raised ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" name="submitAction" value="Save">
                        <span class="mdc-button__ripple"></span>
                        <span class="mdc-button__label">${msg("doSave")}</span>
                    </button>
                </div>
            </div>
        </div>
    </form>

</@layout.mainLayout>
