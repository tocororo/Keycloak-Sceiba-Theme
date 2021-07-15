<#import "template.ftl" as layout>
<@layout.mainLayout active='sessions' bodyClass='sessions'; section>

    <h2 class="mdc-typography mdc-typography--headline4 ml-1">${msg("sessionsHtmlTitle")}</h2>

    <div class="mdc-data-table">
        <div class="mdc-data-table__table-container">
            <table class="mdc-data-table__table" aria-label="${msg("sessionsHtmlTitle")}">
            <thead>
                <tr class="mdc-data-table__header-row">
                    <th class="mdc-data-table__header-cell" role="columnheader" scope="col">${msg("ip")}</th>
                    <th class="mdc-data-table__header-cell" role="columnheader" scope="col">${msg("started")}</th>
                    <th class="mdc-data-table__header-cell" role="columnheader" scope="col">${msg("lastAccess")}</th>
                    <th class="mdc-data-table__header-cell" role="columnheader" scope="col">${msg("expires")}</th>
                    <th class="mdc-data-table__header-cell" role="columnheader" scope="col">${msg("clients")}</th>
                </tr>
            </thead>
            <tbody class="mdc-data-table__content">
                <#list sessions.sessions as session>
                    <tr class="mdc-data-table__row">
                        <th class="mdc-data-table__cell" scope="row">${session.ipAddress}</th>
                        <td class="mdc-data-table__cell">${session.started?datetime}</td>
                        <td class="mdc-data-table__cell">${session.lastAccess?datetime}</td>
                        <td class="mdc-data-table__cell">${session.expires?datetime}</td>
                        <td class="mdc-data-table__cell">
                            <#list session.clients as client>
                                ${client}<br/>
                            </#list>
                        </td>
                    </tr>
                </#list>
            </tbody>
            </table>
        </div>
    </div>


    <form action="${url.sessionsUrl}" method="post" class="mt-1">
        <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
        <button id="logout-all-sessions" class="mdc-button mdc-button--raised ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}">
            <span class="mdc-button__ripple"></span>
            <span class="mdc-button__label">${msg("doLogOutAllSessions")}</span>
        </button>
    </form>

</@layout.mainLayout>
