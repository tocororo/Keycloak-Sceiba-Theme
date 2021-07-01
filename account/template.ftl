<#macro mainLayout active bodyClass>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">

    <title>${msg("accountManagementTitle")}</title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico">
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
                        <button class="mdc-icon-button material-icons mdc-ripple-upgraded--unbounded mdc-ripple-upgraded" aria-label="Add to favorites" onclick="mdcMenuAddClass('kc-locale-dropdown')">L</button>
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
                    <button class="mdc-icon-button material-icons mdc-ripple-upgraded--unbounded mdc-ripple-upgraded" aria-label="User" onclick="mdcMenuAddClass('kc-user-dropdown')">
                        U
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

    <div class="container">
        <div class="bs-sidebar col-sm-3">
            <ul>
                <li class="<#if active=='account'>active</#if>"><a href="${url.accountUrl}">${msg("account")}</a></li>
                <#if features.passwordUpdateSupported><li class="<#if active=='password'>active</#if>"><a href="${url.passwordUrl}">${msg("password")}</a></li></#if>
                <li class="<#if active=='totp'>active</#if>"><a href="${url.totpUrl}">${msg("authenticator")}</a></li>
                <#if features.identityFederation><li class="<#if active=='social'>active</#if>"><a href="${url.socialUrl}">${msg("federatedIdentity")}</a></li></#if>
                <li class="<#if active=='sessions'>active</#if>"><a href="${url.sessionsUrl}">${msg("sessions")}</a></li>
                <li class="<#if active=='applications'>active</#if>"><a href="${url.applicationsUrl}">${msg("applications")}</a></li>
                <#if features.log><li class="<#if active=='log'>active</#if>"><a href="${url.logUrl}">${msg("log")}</a></li></#if>
                <#if realm.userManagedAccessAllowed && features.authorization><li class="<#if active=='authorization'>active</#if>"><a href="${url.resourceUrl}">${msg("myResources")}</a></li></#if>
            </ul>
        </div>

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

</body>
</html>
</#macro>