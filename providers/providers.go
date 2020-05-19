package providers

import (
	"github.com/bitly/oauth2_proxy/cookie"
)

type Provider interface {
	Data() *ProviderData
	GetEmailAddress(*SessionState) (string, error)
	Redeem(string, string) (*SessionState, error)
	ValidateGroup(string) bool
	ValidateSessionState(*SessionState) bool
	GetLoginURL(redirectURI, finalRedirect string) string
	RefreshSessionIfNeeded(*SessionState) (bool, error)
	SessionFromCookie(string, *cookie.Cipher) (*SessionState, error)
	CookieForSession(*SessionState, *cookie.Cipher) (string, error)
}

// For provider like okta, we can not only know the user's email and name, it
// also provides the groups information. This is useful for us to use that to
// determine whether a privelege should be granted based on group membership.
type HaveUserGruops interface {
	GetUserGroups(*SessionState) ([]string, error)
}

func New(provider string, p *ProviderData) Provider {
	switch provider {
	case "myusa":
		return NewMyUsaProvider(p)
	case "linkedin":
		return NewLinkedInProvider(p)
	case "facebook":
		return NewFacebookProvider(p)
	case "github":
		return NewGitHubProvider(p)
	case "azure":
		return NewAzureProvider(p)
	case "gitlab":
		return NewGitLabProvider(p)
	case "okta":
		return NewOktaProvider(p)
	default:
		return NewGoogleProvider(p)
	}
}
