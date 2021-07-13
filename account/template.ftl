<#macro mainLayout active bodyClass>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">

    <title>${msg("accountManagementTitle")}</title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico">
    <#--  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">  -->
    <#if properties.stylesCommon?has_content>
        <#list properties.stylesCommon?split(' ') as style>
            <link href="${url.resourcesCommonPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script type="text/javascript" src="${url.resourcesPath}/${script}"></script>
        </#list>
    </#if>
</head>
<body class="admin-console user ${bodyClass}">
        
    <header class="mdc-top-app-bar mdc-theme--secondary-bg mdc-elevation--z8 ${properties.kcFormHeaderClass!}">
        <nav class="mdc-top-app-bar__row" role="navigation">
            <div class="mdc-top-app-bar__section mdc-top-app-bar__section--align-start">
                <h1 class="navbar-title">${properties.accountTitleHtml}</h1>
            </div>
            <div class="mdc-top-app-bar__section mdc-top-app-bar__section--align-end">
                <#if realm.internationalizationEnabled>
                    <div class="mdc-menu-surface--anchor mr">
                        <button class="mdc-icon-button material-icons mdc-ripple-upgraded--unbounded mdc-ripple-upgraded" aria-label="Languajes" aria-describedby="tooltip-locale" onclick="mdcMenuAddClass('kc-locale-dropdown')">translate</button>
                        <div class="mdc-menu mdc-menu-surface" name="locale-menu" id="kc-locale-dropdown">
                            <ul class="mdc-list" role="menu" aria-hidden="true" aria-orientation="vertical" tabindex="-1">
                                <#list locale.supported as l>
                                    <#if locale.current == l.label>
                                        <a class="mdc-list-item mdc-list-item--activated"  href="${l.url}">
                                            <span class="mdc-list-item__ripple"></span>
                                            <span class="mdc-list-item__text">${l.label}</span>
                                        </a>
                                    <#else>
                                        <a class="mdc-list-item"  href="${l.url}">
                                            <span class="mdc-list-item__ripple"></span>
                                            <span class="mdc-list-item__text">${l.label}</span>
                                        </a>
                                    </#if>
                                </#list>
                            </ul>
                        </div>
                    </div>
                </#if>

                <div class="mdc-menu-surface--anchor ml">
                    <button class="mdc-icon-button material-icons mdc-ripple-upgraded--unbounded mdc-ripple-upgraded" aria-label="User" aria-describedby="tooltip-account" onclick="mdcMenuAddClass('kc-user-dropdown')">
                        account_circle
                    </button>
                    <div class="mdc-menu mdc-menu-surface" name="user-menu" id="kc-user-dropdown">
                        <ul class="mdc-list" role="menu" aria-hidden="true" aria-orientation="vertical" tabindex="-1">
                            <#if referrer?has_content && referrer.url?has_content>
                                <a href="${referrer.url}" id="referrer" class="mdc-list-item">
                                    <span class="mdc-list-item__ripple"></span>
                                    <span class="mdc-list-item__text">${msg("backTo",referrer.name)}</span>
                                </a>
                            </#if>
                            <a class="mdc-list-item" href="${url.logoutUrl}">
                                <span class="mdc-list-item__ripple"></span>
                                <span class="mdc-list-item__text">${msg("doSignOut")}</span>
                            </a>
                        </ul>
                    </div>
                </div>
            </div>
            
        </nav>
    </header>

<div class="flex flex-center">
    <aside class="mdc-drawer mdc-drawer--dismissible mdc-drawer--open">
        <div class="mdc-drawer__content">
            <nav class="mdc-list">
                <a class="mdc-list-item" href="${url.accountUrl}">
                    <span class="mdc-list-item__ripple"></span>
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">manage_accounts</i>
                    <span class="mdc-list-item__text">${msg("account")}</span>
                </a>
                <#if features.passwordUpdateSupported>
                    <a class="mdc-list-item" href="${url.passwordUrl}">
                        <span class="mdc-list-item__ripple"></span>
                        <i class="material-icons mdc-list-item__graphic" aria-hidden="true">password</i>
                        <span class="mdc-list-item__text">${msg("password")}</span>
                    </a>
                </#if>
                <a class="mdc-list-item" href="${url.totpUrl}">
                    <span class="mdc-list-item__ripple"></span>
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">security</i>
                    <span class="mdc-list-item__text">${msg("authenticator")}</span>
                </a>
                <#if features.identityFederation>
                    <a class="mdc-list-item" href="${url.socialUrl}">
                        <span class="mdc-list-item__ripple"></span>
                        <i class="material-icons mdc-list-item__graphic" aria-hidden="true">perm_identity</i>
                        <span class="mdc-list-item__text">${msg("federatedIdentity")}</span>
                    </a>
                </#if>
                <a class="mdc-list-item" href="${url.sessionsUrl}">
                    <span class="mdc-list-item__ripple"></span>
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">accessibility</i>
                    <span class="mdc-list-item__text">${msg("sessions")}</span>
                </a>
                <a class="mdc-list-item" href="${url.applicationsUrl}">
                    <span class="mdc-list-item__ripple"></span>
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">settings_applications</i>
                    <span class="mdc-list-item__text">${msg("applications")}</span>
                </a>
                <#if features.log>
                    <a class="mdc-list-item" href="${url.logUrl}">
                        <span class="mdc-list-item__ripple"></span>
                        <i class="material-icons mdc-list-item__graphic" aria-hidden="true">analytics</i>
                        <span class="mdc-list-item__text">${msg("log")}</span>
                    </a>
                </#if>
                <#if realm.userManagedAccessAllowed && features.authorization>
                    <a class="mdc-list-item" href="${url.resourceUrl}">
                        <span class="mdc-list-item__ripple"></span>
                        <i class="material-icons mdc-list-item__graphic" aria-hidden="true">assessment</i>
                        <span class="mdc-list-item__text">${msg("myResources")}</span>
                    </a>
                </#if>
            </nav>
        </div>
    </aside>
    <div class="col-sm-9 content-area">
        <#if message?has_content>
            <div class="alert alert-${message.type}">
                <#if message.type=='success' ><span class="pficon pficon-ok"></span></#if>
                <#if message.type=='error' ><span class="pficon pficon-error-circle-o"></span></#if>
                <span class="kc-feedback-text">${kcSanitize(message.summary)?no_esc}</span>
            </div>
        </#if>

        <#nested "content">
    </div>
</div>


<#--  TOOLTIPS  -->
<div id="tooltip-locale" class="mdc-tooltip" role="tooltip" aria-haspopup="dialog" aria-hidden="true">
  <div class="mdc-tooltip__surface">
    ${locale.current}
  </div>
</div>
<div id="tooltip-account" class="mdc-tooltip" role="tooltip" aria-haspopup="dialog" aria-hidden="true">
  <div class="mdc-tooltip__surface">
    ${msg("client_account")}
  </div>
</div>

</body>
</html>
</#macro>