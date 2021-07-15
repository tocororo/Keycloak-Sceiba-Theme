<#import "template.ftl" as layout>
<@layout.mainLayout active='applications' bodyClass='applications'; section>

    <h2 class="mdc-typography mdc-typography--headline4 ml-1">${msg("applicationsHtmlTitle")}</h2>

    <form action="${url.applicationsUrl}" method="post" id="form-table-responsive" class="mdc-data-table">
        <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
        <input type="hidden" id="referrer" name="referrer" value="${stateChecker}">
        <div class="mdc-data-table__table-container">
            <table class="mdc-data-table__table" aria-label="${msg("applicationsHtmlTitle")}">
                <thead>
                    <tr class="mdc-data-table__header-row">
                        <td class="mdc-data-table__header-cell" role="columnheader" scope="col">${msg("application")}</td>
                        <td class="mdc-data-table__header-cell" role="columnheader" scope="col">${msg("availableRoles")}</td>
                        <td class="mdc-data-table__header-cell" role="columnheader" scope="col">${msg("grantedPermissions")}</td>
                        <td class="mdc-data-table__header-cell" role="columnheader" scope="col">${msg("additionalGrants")}</td>
                        <td class="mdc-data-table__header-cell" role="columnheader" scope="col">${msg("action")}</td>
                    </tr>
                </thead>

                <tbody class="mdc-data-table__content">
                <#list applications.applications as application>
                    <tr class="mdc-data-table__row">
                        <td class="mdc-data-table__cell">
                            <#if application.effectiveUrl?has_content><a href="${application.effectiveUrl}"></#if>
                                <#if application.client.name?has_content>${advancedMsg(application.client.name)}<#else>${application.client.clientId}</#if>
                            <#if application.effectiveUrl?has_content></a></#if>
                        </td>

                        <td class="mdc-data-table__cell">
                            <#list application.realmRolesAvailable as role>
                                <#if role.description??>${advancedMsg(role.description)}<#else>${advancedMsg(role.name)}</#if>
                                <#if role_has_next>, </#if>
                            </#list>
                            <#list application.resourceRolesAvailable?keys as resource>
                                <#if application.realmRolesAvailable?has_content>, </#if>
                                <#list application.resourceRolesAvailable[resource] as clientRole>
                                    <#if clientRole.roleDescription??>${advancedMsg(clientRole.roleDescription)}<#else>${advancedMsg(clientRole.roleName)}</#if>
                                    ${msg("inResource")} <strong><#if clientRole.clientName??>${advancedMsg(clientRole.clientName)}<#else>${clientRole.clientId}</#if></strong>
                                    <#if clientRole_has_next>, </#if>
                                </#list>
                            </#list>
                        </td>

                        <td class="mdc-data-table__cell">
                            <#if application.client.consentRequired>
                                <#list application.clientScopesGranted as claim>
                                    ${advancedMsg(claim)}<#if claim_has_next>, </#if>
                                </#list>
                            <#else>
                                <strong>${msg("fullAccess")}</strong>
                            </#if>
                        </td>

                        <td class="mdc-data-table__cell">
                        <#list application.additionalGrants as grant>
                                ${advancedMsg(grant)}<#if grant_has_next>, </#if>
                            </#list>
                        </td>

                        <td class="mdc-data-table__cell">
                            <#if (application.client.consentRequired && application.clientScopesGranted?has_content) || application.additionalGrants?has_content>
                                <button type='submit' class='mdc-button${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!}' id='revoke-${application.client.clientId}' name='clientId' value="${application.client.id}">
                                    <span class="mdc-button__ripple"></span>
                                    <span class="mdc-button__label">${msg("revoke")}</span>
                                </button>
                            </#if>
                        </td>
                    </tr>
                </#list>
                </tbody>
            </table>
        </div>
    </form>

</@layout.mainLayout>