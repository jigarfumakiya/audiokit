
//
//  MicrophoneMonitor.swift
//  audio_waveforms
//
//  Created by jigar fumakiya on 06/11/23.
//


import AVFoundation
import AudioKit

class MicrophoneMonitor {
    var mic: AKMicrophone
    var tracker: AKFrequencyTracker
    var silence: AKBooster
    
    
    init() {
        AKSettings.audioInputEnabled = true
        let format = AKSettings.audioFormat
        mic = AKMicrophone(with: format)!
        tracker = AKFrequencyTracker(mic)
        silence = AKBooster(tracker, gain: 0)
    }
    
    func startMonitoring() {
        AKManager.output = silence
        
        do {
            try AKManager.start()
        } catch {
            AKLog("AudioKit did not start!")
        }
        
    }
    
    func stopMonitoring() {
        do {
            try AKManager.stop()
        } catch {
            AKLog("AudioKit did not stop!")
        }
    }
    
    var amplitude: Double {
        return tracker.amplitude
    }
    
    var frequency: Double {
        return tracker.frequency
    }
}

