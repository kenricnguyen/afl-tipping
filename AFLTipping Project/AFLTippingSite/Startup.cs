using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(AFLTippingSite.Startup))]
namespace AFLTippingSite
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
