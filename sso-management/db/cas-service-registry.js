/*
 Source Server         : china-sso-mongodb-3-6-primary
 Source Server Type    : MongoDB
 Source Server Version : 30611
 Source Host           : localhost:27017
 Source Schema         : cas-mongo-database
 Target Server Type    : MongoDB
 Target Server Version : 30611
 File Encoding         : 65001
*/

// ----------------------------
// Collection structure for cas-service-registry
// ----------------------------
db.getCollection("cas-service-registry").drop();
db.createCollection("cas-service-registry");

// ----------------------------
// Documents of cas-service-registry
// ----------------------------
db.getCollection("cas-service-registry").insert([ {
    _id: NumberLong("1426412242"),
    _class: "org.apereo.cas.services.RegexRegisteredService",
    serviceId: "^https://passport.sso.com:8081/cas-management/manage.html",
    name: "Services Management Web Application",
    description: "Services Management Web Application",
    proxyPolicy: {
        _class: "org.apereo.cas.services.RefuseRegisteredServiceProxyPolicy"
    },
    evaluationOrder: NumberInt("0"),
    usernameAttributeProvider: {
        _class: "org.apereo.cas.services.DefaultRegisteredServiceUsernameProvider",
        canonicalizationMode: "NONE",
        encryptUsername: false
    },
    logoutType: "BACK_CHANNEL",
    requiredHandlers: [ ],
    attributeReleasePolicy: {
        _class: "org.apereo.cas.services.ReturnAllowedAttributeReleasePolicy",
        allowedAttributes: [ ],
        principalAttributesRepository: {
            _class: "org.apereo.cas.authentication.principal.DefaultPrincipalAttributesRepository",
            expiration: NumberLong("2"),
            timeUnit: "HOURS"
        },
        authorizedToReleaseCredentialPassword: false,
        authorizedToReleaseProxyGrantingTicket: false,
        excludeDefaultAttributes: false
    },
    multifactorPolicy: {
        _class: "org.apereo.cas.services.DefaultRegisteredServiceMultifactorPolicy",
        multifactorAuthenticationProviders: [ ],
        failureMode: "CLOSED",
        bypassEnabled: false
    },
    accessStrategy: {
        _class: "org.apereo.cas.services.DefaultRegisteredServiceAccessStrategy",
        enabled: true,
        ssoEnabled: true,
        requireAllAttributes: true,
        requiredAttributes: { },
        rejectedAttributes: { },
        caseInsensitive: false
    },
    properties: { }
} ]);
