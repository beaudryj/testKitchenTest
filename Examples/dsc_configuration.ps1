Configuration Sample_xWebsite
{

    # Import the module that defines custom resources
    Import-DscResource -Module xWebAdministration
    Import-DscResource –Module PSDesiredStateConfiguration
    
    Node $env:ComputerName
    {
        # Install the IIS role
        WindowsFeature IIS
        {
            Ensure          = "Present"
            Name            = "Web-Server"
        }
        # Stop the default website
        xWebsite DefaultSite
        {
            Ensure          = "Present"
            Name            = "Default Web Site"
            PhysicalPath    = "C:\Websites\index.html"
            State           = "Started"
            #PhysicalPath    = "C:\inetpub\wwwroot"
            DependsOn       = "[WindowsFeature]IIS"
        }
    }
}
