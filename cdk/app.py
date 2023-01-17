#!/usr/bin/env python3
import os

import aws_cdk as cdk
from cdk.cdk_frontend_angular import CdkFrontendAngularStack
from cdk.cdk_stack import CdkStack

app = cdk.App()
CdkStack(app, "lguerralab-cdk-frontend-nuxt")
CdkFrontendAngularStack(app, "lguerralab-cdk-frontend-angular")

app.synth()
