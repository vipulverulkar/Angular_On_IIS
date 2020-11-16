FROM mcr.microsoft.com/windows/servercore/iis
RUN powershell -NoProfile -Command Remove-Item -Recurse C:\inetpub\wwwroot\*
# Install IISRewrite Module
ADD http://download.microsoft.com/download/D/D/E/DDE57C26-C62C-4C59-A1BB-31D58B36ADA2/rewrite_amd64_en-US.msi c:/inetpub/rewrite_amd64_en-US.msi
RUN powershell -Command Start-Process c:/inetpub/rewrite_amd64_en-US.msi -ArgumentList "/qn" -Wait
Run powershell -Command Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpRedirect
WORKDIR /inetpub/wwwroot
COPY dist/ .
