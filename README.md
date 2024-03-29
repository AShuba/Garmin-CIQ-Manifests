# Garmin-CIQ-Manifests
Set of Garmin Connect IQ SDK manifests files with actual list of supported devices

Every year Garmin releases a lot of wearables devices with different minimal CIQ SDK levels.
The goal of this repo is to genearte manifest.xml file with actual list of Garmin devices which are related to the concrete Garmin IQ SDK API level. This can help you to keep actual list of Garmin devices connected with your Connect IQ aplication.

## How to use the repo
You have two options here:
1) Just check the folder name with the minimal Garmin IQ SDK API level you want to use with your application, copy required manifest file and add it you your own Monkey C project.
2) Run manifest-generator script on your local machine inside the Garmin SDK's 'ConnectIQ/Devices' folder. It will generated manifest.xml file with all required productsIds included.

`./manifest-generator.sh --min-api-level 4.2.0`

`cat manifest.xml`

```
<!-- This manifest was generated by project https://github.com/AShuba/Garmin-CIQ-Manifests -->
<iq:manifest version="3" xmlns:iq="http://www.garmin.com/xml/connectiq">
    <iq:application id="" type="" name="" entry="" launcherIcon="" minApiLevel="4.2.0">
        <iq:products>
            <iq:product id="approachs7042mm"/>
            <iq:product id="approachs7047mm"/>
            <iq:product id="d2airx10"/>
            <iq:product id="d2mach1"/>
            <iq:product id="descentmk343mm"/>
            <iq:product id="descentmk351mm"/>
            <iq:product id="epix2"/>
            <iq:product id="epix2pro42mm"/>
            <iq:product id="epix2pro47mm"/>
            <iq:product id="epix2pro47mmsystem7preview"/>
            <iq:product id="epix2pro51mm"/>
            <iq:product id="fenix7"/>
            <iq:product id="fenix7pro"/>
            <iq:product id="fenix7pronowifi"/>
            <iq:product id="fenix7s"/>
            <iq:product id="fenix7spro"/>
            <iq:product id="fenix7x"/>
            <iq:product id="fenix7xpro"/>
            <iq:product id="fenix7xpronowifi"/>
            <iq:product id="fr165"/>
            <iq:product id="fr165m"/>
            <iq:product id="fr255"/>
            <iq:product id="fr255m"/>
            <iq:product id="fr255s"/>
            <iq:product id="fr255sm"/>
            <iq:product id="fr265"/>
            <iq:product id="fr265s"/>
            <iq:product id="fr955"/>
            <iq:product id="fr965"/>
            <iq:product id="marq2"/>
            <iq:product id="marq2aviator"/>
            <iq:product id="venu2"/>
            <iq:product id="venu2plus"/>
            <iq:product id="venu2s"/>
            <iq:product id="venu3"/>
            <iq:product id="venu3s"/>
            <iq:product id="venusq2"/>
            <iq:product id="venusq2m"/>
            <iq:product id="vivoactive5"/>
        </iq:products>
        <iq:permissions>
        </iq:permissions>
        <iq:languages>
        </iq:languages>
        <iq:barrels>
        </iq:barrels>
    </iq:application>
</iq:manifest>

```

## License
Garmin-CIQ-Manifests source code is released under the MIT License http://www.opensource.org/licenses/mit-license


Copyright (c) 2024 Anatolii Shuba

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
