local boost = {}

boost.booster = function()
    task.spawn(function()
        local flagtables = {
			["FFlagWindowsLaunchAnalytics"] = "False",
			["DFIntCrashUploadToBacktracePercentage"] = "0",
			["FFlagRenderGpuTextureCompressor"] = "True",
			["FFlagEnableSoundTelemetry"] = "False",
			["FIntReportDeviceInfoRollout"] = "0",
			["FStringTerrainMaterialTable2022"] = "",
			["FFlagDisableNewIGMinDUA"] = "True",
			["FIntTerrainOTAMaxTextureSize"] = "1024",
			["DFFlagGpuVsCpuBoundTelemetry"] = "False",
			["FFlagDebugDisableTelemetryV2Stat"] = "True",
			["DFFlagESGamePerfMonitorEnabled"] = "False",
			["FFlagEnableBatteryStateLogger"] = "False",
			["DFIntCSGLevelOfDetailSwitchingDistanceL23"] = "0",
			["FFlagDebugDisplayFPS"] = "False",
			["DFFlagQueueDataPingFromSendData"] = "True",
			["DFFlagEphemeralCounterInfluxReportingEnabled"] = "False",
			["DFIntUserIdPlayerNameLifetimeSeconds"] = "86400",
			["FFlagDebugRenderingSetDeterministic"] = "True",
			["FFlagEnableAudioOutputDevice"] = "false",
			["FIntHSRClusterSymmetryDistancePercent"] = "10000",
			["FFlagEnableV3MenuABTest3"] = "False",
			["FFlagEnableInGameMenuControls"] = "False",
			["FFlagDebugDisableTelemetryV2Counter"] = "True",
			["DFIntPredictedOOMPercent"] = "0",
			["DFStringAltHttpPointsReporterUrl"] = "null",
			["FIntDefaultMeshCacheSizeMB"] = "256",
			["DFIntGoogleAnalyticsLoadPlayerHundredth"] = "0",
			["FFlagNewLightAttenuation"] = "True",
			["FFlagDebugDisableOTAMaterialTexture"] = "true",
			["DFLogBatchAssetApiLog"] = "3",
			["DFIntRunningBaseOrientationP"] = "450",
			["DFFlagEnableMemProfilingOutsideClient"] = "False",
			["FFlagFastGPULightCulling3"] = "True",
			["DFStringLightstepHTTPTransportUrlHost"] = "null",
			["FFlagRenderPerformanceTelemetry"] = "False",
			["FFlagEnableMenuModernizationABTest2"] = "False",
			["DFFlagAvatarChatServiceUserPermissionsAudioEligible"] = "False",
			["FFlagRenderCheckThreading"] = "True",
			["FFlagGpuGeometryManager7"] = "True",
			["FFlagFacialAnimationStreamingServiceUniverseSettingsEnableAudio"] = "False",
			["DFFlagEnableMemProfilingStorePlaceId"] = "False",
			["DFIntHttpCurlConnectionCacheSize"] = "134217728",
			["FFlagVoiceChatServiceManagerUseAvatarChat"] = "False",
			["DFLogHttpTraceError"] = "0",
			["DFIntDebugFRMQualityLevelOverride"] = "1",
			["FFlagHandleAltEnterFullscreenManually"] = "False",
			["FIntV1MenuLanguageSelectionFeaturePerMillageRollout"] = "0",
			["DFFlagDebugRenderForceTechnologyVoxel"] = "True",
			["FFlagAudioDeviceTelemetry"] = "false",
			["FFlagReportFpsAndGfxQualityPercentiles"] = "False",
			["DFIntNewRunningBaseAltitudeD"] = "50",
			["DFFlagCrashUploadFullDumps"] = "False",
			["DFFlagDebugAnalyticsSendUserId"] = "False",
			["FintRenderGrassHeightScaler"] = "0",
			["DFIntLoginTelemetryHundredthsPercent"] = "0",
			["FStringTerrainMaterialTablePre2022"] = "",
			["DFIntStartupTracingInfluxRollout"] = "0",
			["FFlagEnableAdsAPI"] = "False",
			["FFlagAvatarChatSettingsEnabled2"] = "False",
			["FIntLinkBrowserTrackerToDeviceRollout"] = "0",
			["DFFlagEnableFmodErrorsTelemetry"] = "False",
			["FLogNetwork"] = "7",
			["FFlagAnimationClipMemCacheEnabled"] = "True",
			["DFIntClientLightingTechnologyChangedTelemetryHundredthsPercent"] = "0",
			["FStringErrorUploadToBacktraceBaseUrl"] = "https://opt-out.roblox.com",
			["FFlagEnableBetaBadgeLearnMore"] = "false",
			["FFlagFacialAnimationStreamingServiceUserSettingsOptInAudio"] = "False",
			["FIntBootstrapperTelemetryReportingHundredthsPercentage"] = "0",
			["DFLogHttpTraceLight"] = "0",
			["FFlagDebugDisableTelemetryPoint"] = "True",
			["FIntEmotesAnimationsPerPlayerCacheSize"] = "16777216",
			["FFlagFixGraphicsQuality"] = "True",
			["DFIntLightstepHTTPTransportHundredthsPercent2"] = "0",
			["FFlagPreloadAllFonts"] = "True",
			["FFlagEnableAccessibilitySettingsEffectsInExperienceChat"] = "True",
			["FFlagBetaBadgeLearnMoreLinkFormview"] = "false",
			["FFlagEnableInGameMenuChrome"] = "true",
			["FFlagDebugDisableTelemetryV2Event"] = "True",
			["FFlagGraphicsGLEnableSuperHQShadersExclusion"] = "False",
			["FFlagEnableMenuControlsABTest"] = "False",
			["FFlagCommitToGraphicsQualityFix"] = "True",
			["FIntCameraMaxZoomDistance"] = "99999",
			["DFIntCanHideGuiGroupId"] = "32380007",
			["DFStringLightstepHTTPTransportUrlPath"] = "null",
			["FFlagEnableInGameMenuChromeABTest"] = "True",
			["GoogleAnalyticsAccountPropertyIDPlayer"] = "null",
			["FIntLmsClientRollout2"] = "0",
			["FStringGamesUrlPath"] = "/games/",
			["FIntAbuseReportScreenshotMaxSize"] = "0",
			["DFLogHttpTrace"] = "0",
			["FFlagEnableMenuModernizationABTest"] = "False",
			["FIntFRMMaxGrassDistance"] = "0",
			["FIntRenderGrassDetailStrands"] = "0",
			["FFlagGraphicsSettingsOnlyShowValidModes"] = "True",
			["DFFlagEnableGCapsHardwareTelemetry"] = "False",
			["DFIntCrashReportingHundredthsPercentage"] = "0",
			["DFFlagAudioDeviceTelemetry"] = "False",
			["FFlagCoreGuiTypeSelfViewPresent"] = "False",
			["DFStringLightstepToken"] = "null",
			["DFIntWriteFullDmpPercent"] = "0",
			["FFlagDebugForceFutureIsBrightPhase3"] = "True",
			["FStringPerformanceSendMeasurementAPISubdomain"] = "opt-out",
			["DFIntConnectionMTUSize"] = "900",
			["FFlagLuaAppSystemBar"] = "False",
			["FIntFRMMinGrassDistance"] = "0",
			["FFlagGraphicsGLEnableHQShadersExclusion"] = "False",
			["FIntRenderEnableGlobalInstancingD3D11Percent"] = "100",
			["FFlagDebugForceChatDisabled"] = "False",
			["DFStringAnalyticsNS1ApplicationId"] = "opt-out",
			["FFlagEnableInGameMenuModernization"] = "False",
			["FFlagEnableAccessibilitySettingsAPIV2"] = "True",
			["FFlagEnableQuickGameLaunch"] = "False",
			["DFFlagPredictedOOM"] = "False",
			["FFlagEnableInGameMenuV3"] = "False",
			["DFIntCSGLevelOfDetailSwitchingDistance"] = "1",
			["FStringCoreScriptBacktraceErrorUploadToken"] = "null",
			["DFStringCrashUploadToBacktraceBaseUrl"] = "null",
			["DFStringAltTelegrafHTTPTransportUrl"] = "null",
			["FFlagEnableAccessibilitySettingsEffectsInCoreScripts2"] = "True",
			["FStringVoiceBetaBadgeLearnMoreLink"] = "null",
			["FFlagEnableCameraByDefault"] = "False",
			["FFlagInGameMenuV1FullScreenTitleBar"] = "False",
			["FFlagVoiceBetaBadge"] = "false",
			["DFIntCSGLevelOfDetailSwitchingDistanceL34"] = "0",
			["FFlagBatchAssetApi"] = "True",
			["FFlagImmersiveAdsWhitelistDisabled"] = "False",
			["FFlagGraphicsCheckComputeSupport"] = "True",
			["FIntMeshContentProviderForceCacheSize"] = "268435456",
			["FFlagDebugGraphicsCrashOnLeaks"] = "False",
			["FIntRenderShadowmapBias"] = "0",
			["FFlagDisablePostFx"] = "True",
			["DFFlagDebugPerfMode"] = "True",
			["FFlagGraphicsEnableD3D10Compute"] = "True",
			["DFStringCrashUploadToBacktraceMacPlayerToken"] = "null",
			["FFlagPreloadMinimalFonts"] = "True",
			["DFStringCrashUploadToBacktraceWindowsPlayerToken"] = "null",
			["DFIntUserIdPlayerNameCacheSize"] = "33554432",
			["FIntFontSizePadding"] = "3",
			["DFFlagTextureQualityOverrideEnabled"] = "True",
			["DFStringRobloxAnalyticsURL"] = "null",
			["DFStringAnalyticsEventStreamUrlEndpoint"] = "opt-out",
			["FFlagTrackMacWebLaunchFlow"] = "False",
			["DFFlagVideoCaptureServiceEnabled"] = "False",
			["DFStringRobloxAnalyticsSubDomain"] = "opt-out",
			["FFlagFacialAnimationStreamingServiceUserSettingsOptInVideo"] = "False",
			["FIntTaskSchedulerAutoThreadLimit"] = "8",
			["DFFlagBrowserTrackerIdTelemetryEnabled"] = "False",
			["FFlagDebugDisableTelemetryEphemeralStat"] = "True",
			["DFFlagBaseNetworkMetrics"] = "False",
			["DFIntS2PhysicsSenderRate"] = "250",
			["FFlagLocServicePerformanceAnalyticsEnabled"] = "False",
			["DFStringTelegrafHTTPTransportUrl"] = "null",
			["FStringImmersiveAdsUniverseWhitelist"] = "0",
			["FFlagAddGameInstanceIdToSessionTracking"] = "False",
			["FFlagTrackPlaceIdForCrashEnabled"] = "False",
			["DFIntTaskSchedulerTargetFps"] = "999",
        }

        local function cleanFlagName(flag)
            return flag:gsub("^(DFInt|DFFlag|FString|FLog|FFlag|FInt)", "")
        end

        if setfflag and getfflag then
            task.spawn(function()
                local start = os.clock()
                for key, value in pairs(flagtables) do
                    local success, exists = pcall(getfflag, cleanFlagName(key))
                    if success and exists then
                        pcall(setfflag, cleanFlagName(key), value)
                    end
                end
                warn("Done in " .. os.clock() - start)
            end)
        else
            print("setfflag/getfflag not supported")
        end
    end)
end
return boost
