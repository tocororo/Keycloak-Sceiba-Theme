<#import "template.ftl" as layout>
<@layout.mainLayout active='totp' bodyClass='totp'; section>

    <div class="row">
        <h2 class="mdc-typography mdc-typography--headline4">${msg("authenticatorTitle")}</h2>
        <#if totp.otpCredentials?size == 0>
            <span class="mdc-typography mdc-typography--subtitle2"><span class="required">*</span> ${msg("requiredFields")}</span>
        </#if>
    </div>

    <#if totp.enabled>
        <table class="table table-bordered table-striped">
            <thead>
            <#if totp.otpCredentials?size gt 1>
                <tr>
                    <th colspan="4">${msg("configureAuthenticators")}</th>
                </tr>
            <#else>
                <tr>
                    <th colspan="3">${msg("configureAuthenticators")}</th>
                </tr>
            </#if>
            </thead>
            <tbody>
            <#list totp.otpCredentials as credential>
                <tr>
                    <td class="provider">${msg("mobile")}</td>
                    <#if totp.otpCredentials?size gt 1>
                        <td class="provider">${credential.id}</td>
                    </#if>
                    <td class="provider">${credential.userLabel!}</td>
                    <td class="action">
                        <form action="${url.totpUrl}" method="post" class="form-inline">
                            <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
                            <input type="hidden" id="submitAction" name="submitAction" value="Delete">
                            <input type="hidden" id="credentialId" name="credentialId" value="${credential.id}">
                            <button id="remove-mobile" class="btn btn-default">
                                <i class="pficon pficon-delete"></i>
                            </button>
                        </form>
                    </td>
                </tr>
            </#list>
            </tbody>
        </table>
        <#else>

    <hr/>

    <ol class="mdc-typography--body2">
        <li>
            <p>${msg("totpStep1")}</p>

            <ul>
                <#list totp.policy.supportedApplications as app>
                    <li>${app}</li>
                </#list>
            </ul>
        </li>

        <#if mode?? && mode = "manual">
            <li>
                <p>${msg("totpManualStep2")}</p>
                <p><span id="kc-totp-secret-key">${totp.totpSecretEncoded}</span></p>
                <p><a href="${totp.qrUrl}" id="mode-barcode">${msg("totpScanBarcode")}</a></p>
            </li>
            <li>
                <p>${msg("totpManualStep3")}</p>
                <ul>
                    <li id="kc-totp-type">${msg("totpType")}: ${msg("totp." + totp.policy.type)}</li>
                    <li id="kc-totp-algorithm">${msg("totpAlgorithm")}: ${totp.policy.getAlgorithmKey()}</li>
                    <li id="kc-totp-digits">${msg("totpDigits")}: ${totp.policy.digits}</li>
                    <#if totp.policy.type = "totp">
                        <li id="kc-totp-period">${msg("totpInterval")}: ${totp.policy.period}</li>
                    <#elseif totp.policy.type = "hotp">
                        <li id="kc-totp-counter">${msg("totpCounter")}: ${totp.policy.initialCounter}</li>
                    </#if>
                </ul>
            </li>
        <#else>
            <li>
                <p>${msg("totpStep2")}</p>
                <p><img src="data:image/png;base64, ${totp.totpSecretQrCode}" alt="Figure: Barcode"></p>
                <p><a href="${totp.manualUrl}" id="mode-manual">${msg("totpUnableToScan")}</a></p>
            </li>
        </#if>
        <li>
            <p>${msg("totpStep3")}</p>
            <p>${msg("totpStep3DeviceName")}</p>
        </li>
    </ol>

    <hr/>

    <form action="${url.totpUrl}" class="form-horizontal w-3 mb-4" method="post">
        <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
        
        <#--  totp field  -->
        <div class="text-field-container">
            <div class="mdc-text-field mdc-text-field--outlined mdc-text-field-100 ${properties.kcFormGroupClass!}">
                <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                    <div class="mdc-notched-outline__leading"></div>
                    <div class="mdc-notched-outline__notch">
                        <label for="totp" class="mdc-floating-label">${msg("authenticatorCode")} <span class="required">*</span></label>
                    </div>
                    <div class="mdc-notched-outline__trailing"></div>
                </div>
                <input tabindex="1" type="text" class="mdc-text-field__input" id="totp" name="totp" autocomplete="off" autofocus/>
                <input type="hidden" id="totpSecret" name="totpSecret" value="${totp.totpSecret}"/>
            </div>
        </div>
        <#--  End totp field  -->

        <div class="text-field-container">
            <div class="mdc-text-field mdc-text-field--outlined mdc-text-field-100 ${properties.kcFormGroupClass!}">
                <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                    <div class="mdc-notched-outline__leading"></div>
                    <div class="mdc-notched-outline__notch">
                        <label for="userLabel" class="mdc-floating-label">${msg("totpDeviceName")}</label>
                    </div>
                    <div class="mdc-notched-outline__trailing"></div>
                </div>
                <input tabindex="2" type="text" class="mdc-text-field__input" id="userLabel" name="userLabel" autocomplete="off"/>
            </div>
            <#if messagesPerField.existsError('userLabel')>
                <div class="mdc-text-field-helper-line">
                    <span id="input-error" class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg mdc-text-field-error" aria-live="polite">
                            ${kcSanitize(messagesPerField.getFirstError('userLabel'))?no_esc}
                    </span>
                </div>
            </#if>
        </div>
        <#--  End userLabel field  -->

        <div class="form-group">
            <div id="kc-form-buttons" class="col-md-offset-2 col-md-10 submit">
                <div class="">
                    <button type="submit" class="mdc-button mdc-button--raised ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" id="saveTOTPBtn" name="submitAction" value="Save">
                        <span class="mdc-button__ripple"></span>
                        <span class="mdc-button__label">${msg("doSave")}</span>
                    </button>
    
                    <button type="submit" class="mdc-button mdc-button--outlined ${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!}" id="cancelTOTPBtn" name="submitAction" value="Cancel">
                        <span class="mdc-button__ripple"></span>
                        <span class="mdc-button__label">${msg("doCancel")}</span>
                    </button>
                </div>
            </div>
        </div>
    </form>
    </#if>

</@layout.mainLayout>
