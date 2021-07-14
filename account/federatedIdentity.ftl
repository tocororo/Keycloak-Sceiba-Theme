<#import "template.ftl" as layout>
<@layout.mainLayout active='social' bodyClass='social'; section>

    <h2 class="mdc-typography mdc-typography--headline4 ml-1">${msg("federatedIdentitiesHtmlTitle")}</h2>

    <div id="federated-identities">
    <#list federatedIdentity.identities as identity>
        <div class="mdc-card">
            <div class="mdc-card__actions" style="padding: 0;">
                <div class="mdc-card__action-buttons">
                    <#--  input field  -->
                    <div class="text-field-container">
                        <div class="mdc-text-field mdc-text-field--outlined mdc-text-field-100 ${properties.kcFormGroupClass!}">
                            <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                                <div class="mdc-notched-outline__leading"></div>
                                <div class="mdc-notched-outline__notch">
                                    <label for="${identity.providerId!}" class="mdc-floating-label">${identity.displayName!}</label>
                                </div>
                                <div class="mdc-notched-outline__trailing"></div>
                            </div>
                            <input disabled="true" class="mdc-text-field__input" value="${identity.userName!}"/>
                        </div>
                    </div>
                    <#--  End input field  -->
                </div>
            
                <div class="mdc-card__action-icons">
                    <#if identity.connected>
                        <#if federatedIdentity.removeLinkPossible>
                            <form action="${url.socialUrl}" method="post" class="form-inline">
                                <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
                                <input type="hidden" id="action" name="action" value="remove">
                                <input type="hidden" id="providerId" name="providerId" value="${identity.providerId!}">
                                <button id="remove-link-${identity.providerId!}" class="mdc-button mdc-card__action mdc-card__action--button mdc-ripple-upgraded">
                                    <span class="mdc-button__ripple"></span>
                                    ${msg("doRemove")}
                                </button>
                            </form>
                        </#if>
                    <#else>
                        <form action="${url.socialUrl}" method="post" class="form-inline">
                            <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
                            <input type="hidden" id="action" name="action" value="add">
                            <input type="hidden" id="providerId" name="providerId" value="${identity.providerId!}">
                            <button id="add-link-${identity.providerId!}" class="mdc-button mdc-card__action mdc-card__action--button mdc-ripple-upgraded">
                                <span class="mdc-button__ripple"></span>
                                ${msg("doAdd")}
                            </button>
                        </form>
                    </#if>
                </div>
            </div>
        </div>
    </#list>
    </div>

</@layout.mainLayout>
