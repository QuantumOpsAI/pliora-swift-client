import Foundation

// Internal to the SDK. Arbitrary external Decoder implementations do not expose
// original JSON numeric tokens and are not claimed to provide this boundary.
final class WorkoutControlJSONDecoder: JSONDecoder, @unchecked Sendable {
    private static let projections=(try! JSONSerialization.jsonObject(with:Data(#"{"WorkoutControlFactReference":{"wwc":"WorkoutControlFactReference"},"WorkoutControlReceipt":{"wwc":"WorkoutControlReceipt"},"WorkoutControlProblemDetails":{"wwc":"WorkoutControlProblemDetails"},"WorkoutControlValues":{"wwc":"WorkoutControlValues"},"WorkoutControlOccurrenceRef":{"wwc":"WorkoutControlOccurrenceRef"},"WorkoutControlBeginSetPayload":{"wwc":"WorkoutControlBeginSetPayload"},"WorkoutControlCompleteSetPayload":{"wwc":"WorkoutControlCompleteSetPayload"},"WorkoutControlSkipSetPayload":{"wwc":"WorkoutControlSkipSetPayload"},"WorkoutControlEndRestAndBeginPayload":{"wwc":"WorkoutControlEndRestAndBeginPayload"},"WorkoutControlApplyValuesPayload":{"wwc":"WorkoutControlApplyValuesPayload"},"WorkoutControlAdjustRestTargetPayload":{"wwc":"WorkoutControlAdjustRestTargetPayload"},"WorkoutControlPausePayload":{"wwc":"WorkoutControlPausePayload"},"WorkoutControlResumePayload":{"wwc":"WorkoutControlResumePayload"},"WorkoutControlAmendLastSetPayload":{"wwc":"WorkoutControlAmendLastSetPayload"},"WorkoutControlActionRequest":{"wwc":"WorkoutControlActionRequest"},"WorkoutControlEntryValues":{"wwc":"WorkoutControlEntryValues"},"WorkoutControlInactivity":{"wwc":"WorkoutControlInactivity"},"WorkoutControlLastSet":{"wwc":"WorkoutControlLastSet"},"WorkoutControlOccurrence":{"wwc":"WorkoutControlOccurrence"},"WorkoutControlOpenSet":{"wwc":"WorkoutControlOpenSet"},"WorkoutControlRest":{"wwc":"WorkoutControlRest"},"WorkoutControlTimer":{"wwc":"WorkoutControlTimer"},"WorkoutControlView":{"wwc":"WorkoutControlView"},"WorkoutControlActionRequestOneOf":{"wwc":"WorkoutControlActionRequestOneOf"},"WorkoutControlActionRequestOneOf1":{"wwc":"WorkoutControlActionRequestOneOf1"},"WorkoutControlActionRequestOneOf2":{"wwc":"WorkoutControlActionRequestOneOf2"},"WorkoutControlActionRequestOneOf3":{"wwc":"WorkoutControlActionRequestOneOf3"},"WorkoutControlActionRequestOneOf4":{"wwc":"WorkoutControlActionRequestOneOf4"},"WorkoutControlActionRequestOneOf5":{"wwc":"WorkoutControlActionRequestOneOf5"},"WorkoutControlActionRequestOneOf6":{"wwc":"WorkoutControlActionRequestOneOf6"},"WorkoutControlActionRequestOneOf7":{"wwc":"WorkoutControlActionRequestOneOf7"},"WorkoutControlActionRequestOneOf8":{"wwc":"WorkoutControlActionRequestOneOf8"},"StudentTodayCardOpenSessionView":{"properties":{"completedSetCount":{"rule":{"type":"integer","minimum":0}},"totalSetCount":{"rule":{"type":"integer","minimum":0}},"serverNow":{"rule":{"type":"string","format":"date-time"}},"controlRevision":{"rule":{"type":"integer","format":"int64","minimum":0,"maximum":9007199254740991}},"restTimer":{"wwc":"WorkoutControlTimer"},"restPrescribedTargetSeconds":{"rule":{"type":"integer","format":"int32","minimum":0}},"restDurationSeconds":{"rule":{"type":"integer","format":"int32","minimum":0}}}},"StudentTodayWorkoutCardView":{"properties":{"prescribedWorkout":{"properties":{"exerciseCount":{"rule":{"type":"integer","minimum":0}},"setCount":{"rule":{"type":"integer","minimum":0}}}},"openSession":{"properties":{"completedSetCount":{"rule":{"type":"integer","minimum":0}},"totalSetCount":{"rule":{"type":"integer","minimum":0}},"serverNow":{"rule":{"type":"string","format":"date-time"}},"controlRevision":{"rule":{"type":"integer","format":"int64","minimum":0,"maximum":9007199254740991}},"restTimer":{"wwc":"WorkoutControlTimer"},"restPrescribedTargetSeconds":{"rule":{"type":"integer","format":"int32","minimum":0}},"restDurationSeconds":{"rule":{"type":"integer","format":"int32","minimum":0}}}},"completedSession":{"properties":{"durationSeconds":{"rule":{"type":"integer","minimum":0}},"completedSetCount":{"rule":{"type":"integer","minimum":0}},"totalSetCount":{"rule":{"type":"integer","minimum":0}},"recordCount":{"rule":{"type":["integer","null"],"minimum":0}}}},"sequencePlan":{"properties":{"workouts":{"items":{"properties":{"position":{"rule":{"type":"integer","minimum":1}},"exerciseCount":{"rule":{"type":"integer","minimum":0}}}}},"extras":{"items":{"properties":{"timesThisWeek":{"rule":{"type":"integer","minimum":0}}}}}}},"offers":{"items":{"properties":{"minDaysBetweenSameWorkout":{"rule":{"type":"integer","minimum":1,"maximum":14}}}}}}},"SetExecutionSyncView":{"properties":{"setIndex":{"rule":{"type":"integer","minimum":1}},"target":{"properties":{"loadValue":{"rule":{"type":["number","null"],"minimum":0}},"reps":{"rule":{"type":["integer","null"],"minimum":0}},"durationSeconds":{"rule":{"type":"integer","minimum":1}},"expectedRpe":{"rule":{"type":["number","null"],"minimum":0,"maximum":10}}}},"actual":{"alternatives":[{"properties":{"loadValue":{"rule":{"type":["number","null"],"minimum":0}},"reps":{"rule":{"type":["integer","null"],"minimum":0}},"durationSeconds":{"rule":{"type":"integer","minimum":0}},"rpe":{"rule":{"type":["number","null"],"minimum":0,"maximum":10}}}}]},"activeDurationSeconds":{"rule":{"type":"integer","format":"int64","minimum":0,"maximum":9007199254740991}},"measuredDurationSeconds":{"rule":{"type":"integer","minimum":1}},"adjustedDurationSeconds":{"rule":{"type":"integer","minimum":1}},"startedAt":{"rule":{"type":"string","format":"date-time"}},"completedAt":{"rule":{"type":"string","format":"date-time"}}}},"PrescribedSetSyncView":{"properties":{"setIndex":{"rule":{"type":"integer","minimum":1}},"repsMin":{"rule":{"type":"integer","minimum":1}},"repsMax":{"rule":{"type":"integer","minimum":1}},"loadPercent":{"rule":{"type":"number","minimum":1,"maximum":150}},"target":{"properties":{"loadValue":{"rule":{"type":["number","null"],"minimum":0}},"reps":{"rule":{"type":["integer","null"],"minimum":0}},"durationSeconds":{"rule":{"type":"integer","minimum":0}},"rpe":{"rule":{"type":["number","null"],"minimum":0,"maximum":10}}}},"effortValue":{"rule":{"type":"number","minimum":0}},"restSeconds":{"rule":{"type":"integer","minimum":0}},"restMinSeconds":{"rule":{"type":"integer","minimum":0}},"restMaxSeconds":{"rule":{"type":"integer","minimum":0}}}},"ExecutionTargetValues":{"properties":{"loadValue":{"rule":{"type":["number","null"],"minimum":0}},"reps":{"rule":{"type":["integer","null"],"minimum":0}},"durationSeconds":{"rule":{"type":"integer","minimum":1}},"expectedRpe":{"rule":{"type":["number","null"],"minimum":0,"maximum":10}}}},"WorkoutSetValues":{"properties":{"loadValue":{"rule":{"type":["number","null"],"minimum":0}},"reps":{"rule":{"type":["integer","null"],"minimum":0}},"durationSeconds":{"rule":{"type":"integer","minimum":0}},"rpe":{"rule":{"type":["number","null"],"minimum":0,"maximum":10}}}},"WorkoutCoreSyncView":{"tagged":{"property":"viewType","cases":{"WORKOUT_SESSION":{"properties":{"startedAt":{"rule":{"type":"string","format":"date-time"}},"calculatedLoadTargets":{"items":{"properties":{"loadPercent":{"rule":{"type":"number","minimum":1,"maximum":150}},"loadValue":{"rule":{"type":"number","minimum":1}}}}}}},"EXERCISE_EXECUTION":{"properties":{"prescribedPosition":{"rule":{"type":"integer","minimum":1}},"executedPosition":{"rule":{"type":"integer","minimum":1}}}},"SET_EXECUTION":{"properties":{"setIndex":{"rule":{"type":"integer","minimum":1}},"target":{"properties":{"loadValue":{"rule":{"type":["number","null"],"minimum":0}},"reps":{"rule":{"type":["integer","null"],"minimum":0}},"durationSeconds":{"rule":{"type":"integer","minimum":1}},"expectedRpe":{"rule":{"type":["number","null"],"minimum":0,"maximum":10}}}},"actual":{"alternatives":[{"properties":{"loadValue":{"rule":{"type":["number","null"],"minimum":0}},"reps":{"rule":{"type":["integer","null"],"minimum":0}},"durationSeconds":{"rule":{"type":"integer","minimum":0}},"rpe":{"rule":{"type":["number","null"],"minimum":0,"maximum":10}}}}]},"activeDurationSeconds":{"rule":{"type":"integer","format":"int64","minimum":0,"maximum":9007199254740991}},"measuredDurationSeconds":{"rule":{"type":"integer","minimum":1}},"adjustedDurationSeconds":{"rule":{"type":"integer","minimum":1}},"startedAt":{"rule":{"type":"string","format":"date-time"}},"completedAt":{"rule":{"type":"string","format":"date-time"}}}},"REST_PERIOD":{"properties":{"targetSeconds":{"rule":{"type":"integer","minimum":0}},"adjustedTargetSeconds":{"rule":{"type":"integer","minimum":0}},"measuredSeconds":{"rule":{"type":"integer","minimum":0}},"startedAt":{"rule":{"type":"string","format":"date-time"}},"endedAt":{"rule":{"type":"string","format":"date-time"}}}},"SUBSTITUTION":{"properties":{"registeredAt":{"rule":{"type":"string","format":"date-time"}}}},"DEFERRAL":{"properties":{"prescribedPosition":{"rule":{"type":"integer","minimum":1}},"executedPosition":{"rule":{"type":"integer","minimum":1}}}},"SET_AMENDMENT":{"properties":{"previous":{"properties":{"loadValue":{"rule":{"type":["number","null"],"minimum":0}},"reps":{"rule":{"type":["integer","null"],"minimum":0}},"durationSeconds":{"rule":{"type":"integer","minimum":0}},"rpe":{"rule":{"type":["number","null"],"minimum":0,"maximum":10}}}},"replacement":{"alternatives":[{"properties":{"loadValue":{"rule":{"type":["number","null"],"minimum":0}},"reps":{"rule":{"type":["integer","null"],"minimum":0}},"durationSeconds":{"rule":{"type":"integer","minimum":0}},"rpe":{"rule":{"type":["number","null"],"minimum":0,"maximum":10}}}}]},"amendedAt":{"rule":{"type":"string","format":"date-time"}}}},"DISCOMFORT_REPORT":{"properties":{"intensity":{"rule":{"type":"integer","minimum":0,"maximum":10}},"reportedAt":{"rule":{"type":"string","format":"date-time"}}}},"PRESCRIPTION_VERSION":{"properties":{"publishedAt":{"rule":{"type":"string","format":"date-time"}},"workouts":{"items":{"properties":{"exercises":{"items":{"properties":{"position":{"rule":{"type":"integer","minimum":1}},"sets":{"items":{"properties":{"setIndex":{"rule":{"type":"integer","minimum":1}},"repsMin":{"rule":{"type":"integer","minimum":1}},"repsMax":{"rule":{"type":"integer","minimum":1}},"loadPercent":{"rule":{"type":"number","minimum":1,"maximum":150}},"target":{"properties":{"loadValue":{"rule":{"type":["number","null"],"minimum":0}},"reps":{"rule":{"type":["integer","null"],"minimum":0}},"durationSeconds":{"rule":{"type":"integer","minimum":0}},"rpe":{"rule":{"type":["number","null"],"minimum":0,"maximum":10}}}},"effortValue":{"rule":{"type":"number","minimum":0}},"restSeconds":{"rule":{"type":"integer","minimum":0}},"restMinSeconds":{"rule":{"type":"integer","minimum":0}},"restMaxSeconds":{"rule":{"type":"integer","minimum":0}}}}}}}}}}}}},"MEDIA_MANIFEST":{"properties":{"assets":{"items":{"properties":{"durationSeconds":{"rule":{"type":"integer","minimum":1}},"byteSize":{"rule":{"type":"integer","format":"int64","minimum":1}},"expiresAt":{"rule":{"type":["string","null"],"format":"date-time"}},"offlineValidUntil":{"rule":{"type":["string","null"],"format":"date-time"}}}}}}},"READ_MODEL_EXERCISE_HISTORY":{"properties":{"entries":{"items":{"properties":{"performedAt":{"rule":{"type":"string","format":"date-time"}},"loadPercent":{"rule":{"type":"number","minimum":1,"maximum":150}},"actual":{"properties":{"loadValue":{"rule":{"type":["number","null"],"minimum":0}},"reps":{"rule":{"type":["integer","null"],"minimum":0}},"durationSeconds":{"rule":{"type":"integer","minimum":0}},"rpe":{"rule":{"type":["number","null"],"minimum":0,"maximum":10}}}}}}}}}}}},"SetAmendmentSyncView":{"properties":{"previous":{"properties":{"loadValue":{"rule":{"type":["number","null"],"minimum":0}},"reps":{"rule":{"type":["integer","null"],"minimum":0}},"durationSeconds":{"rule":{"type":"integer","minimum":0}},"rpe":{"rule":{"type":["number","null"],"minimum":0,"maximum":10}}}},"replacement":{"alternatives":[{"properties":{"loadValue":{"rule":{"type":["number","null"],"minimum":0}},"reps":{"rule":{"type":["integer","null"],"minimum":0}},"durationSeconds":{"rule":{"type":"integer","minimum":0}},"rpe":{"rule":{"type":["number","null"],"minimum":0,"maximum":10}}}}]},"amendedAt":{"rule":{"type":"string","format":"date-time"}}}},"ExerciseHistoryEntry":{"properties":{"performedAt":{"rule":{"type":"string","format":"date-time"}},"loadPercent":{"rule":{"type":"number","minimum":1,"maximum":150}},"actual":{"properties":{"loadValue":{"rule":{"type":["number","null"],"minimum":0}},"reps":{"rule":{"type":["integer","null"],"minimum":0}},"durationSeconds":{"rule":{"type":"integer","minimum":0}},"rpe":{"rule":{"type":["number","null"],"minimum":0,"maximum":10}}}}}},"PrescribedExerciseSyncView":{"properties":{"position":{"rule":{"type":"integer","minimum":1}},"sets":{"items":{"properties":{"setIndex":{"rule":{"type":"integer","minimum":1}},"repsMin":{"rule":{"type":"integer","minimum":1}},"repsMax":{"rule":{"type":"integer","minimum":1}},"loadPercent":{"rule":{"type":"number","minimum":1,"maximum":150}},"target":{"properties":{"loadValue":{"rule":{"type":["number","null"],"minimum":0}},"reps":{"rule":{"type":["integer","null"],"minimum":0}},"durationSeconds":{"rule":{"type":"integer","minimum":0}},"rpe":{"rule":{"type":["number","null"],"minimum":0,"maximum":10}}}},"effortValue":{"rule":{"type":"number","minimum":0}},"restSeconds":{"rule":{"type":"integer","minimum":0}},"restMinSeconds":{"rule":{"type":"integer","minimum":0}},"restMaxSeconds":{"rule":{"type":"integer","minimum":0}}}}}}},"OfflineWorkoutBundleItem":{"properties":{"asOf":{"rule":{"type":["string","null"],"format":"date-time"}},"view":{"tagged":{"property":"viewType","cases":{"WORKOUT_SESSION":{"properties":{"startedAt":{"rule":{"type":"string","format":"date-time"}},"calculatedLoadTargets":{"items":{"properties":{"loadPercent":{"rule":{"type":"number","minimum":1,"maximum":150}},"loadValue":{"rule":{"type":"number","minimum":1}}}}}}},"EXERCISE_EXECUTION":{"properties":{"prescribedPosition":{"rule":{"type":"integer","minimum":1}},"executedPosition":{"rule":{"type":"integer","minimum":1}}}},"SET_EXECUTION":{"properties":{"setIndex":{"rule":{"type":"integer","minimum":1}},"target":{"properties":{"loadValue":{"rule":{"type":["number","null"],"minimum":0}},"reps":{"rule":{"type":["integer","null"],"minimum":0}},"durationSeconds":{"rule":{"type":"integer","minimum":1}},"expectedRpe":{"rule":{"type":["number","null"],"minimum":0,"maximum":10}}}},"actual":{"alternatives":[{"properties":{"loadValue":{"rule":{"type":["number","null"],"minimum":0}},"reps":{"rule":{"type":["integer","null"],"minimum":0}},"durationSeconds":{"rule":{"type":"integer","minimum":0}},"rpe":{"rule":{"type":["number","null"],"minimum":0,"maximum":10}}}}]},"activeDurationSeconds":{"rule":{"type":"integer","format":"int64","minimum":0,"maximum":9007199254740991}},"measuredDurationSeconds":{"rule":{"type":"integer","minimum":1}},"adjustedDurationSeconds":{"rule":{"type":"integer","minimum":1}},"startedAt":{"rule":{"type":"string","format":"date-time"}},"completedAt":{"rule":{"type":"string","format":"date-time"}}}},"REST_PERIOD":{"properties":{"targetSeconds":{"rule":{"type":"integer","minimum":0}},"adjustedTargetSeconds":{"rule":{"type":"integer","minimum":0}},"measuredSeconds":{"rule":{"type":"integer","minimum":0}},"startedAt":{"rule":{"type":"string","format":"date-time"}},"endedAt":{"rule":{"type":"string","format":"date-time"}}}},"SUBSTITUTION":{"properties":{"registeredAt":{"rule":{"type":"string","format":"date-time"}}}},"DEFERRAL":{"properties":{"prescribedPosition":{"rule":{"type":"integer","minimum":1}},"executedPosition":{"rule":{"type":"integer","minimum":1}}}},"SET_AMENDMENT":{"properties":{"previous":{"properties":{"loadValue":{"rule":{"type":["number","null"],"minimum":0}},"reps":{"rule":{"type":["integer","null"],"minimum":0}},"durationSeconds":{"rule":{"type":"integer","minimum":0}},"rpe":{"rule":{"type":["number","null"],"minimum":0,"maximum":10}}}},"replacement":{"alternatives":[{"properties":{"loadValue":{"rule":{"type":["number","null"],"minimum":0}},"reps":{"rule":{"type":["integer","null"],"minimum":0}},"durationSeconds":{"rule":{"type":"integer","minimum":0}},"rpe":{"rule":{"type":["number","null"],"minimum":0,"maximum":10}}}}]},"amendedAt":{"rule":{"type":"string","format":"date-time"}}}},"DISCOMFORT_REPORT":{"properties":{"intensity":{"rule":{"type":"integer","minimum":0,"maximum":10}},"reportedAt":{"rule":{"type":"string","format":"date-time"}}}},"PRESCRIPTION_VERSION":{"properties":{"publishedAt":{"rule":{"type":"string","format":"date-time"}},"workouts":{"items":{"properties":{"exercises":{"items":{"properties":{"position":{"rule":{"type":"integer","minimum":1}},"sets":{"items":{"properties":{"setIndex":{"rule":{"type":"integer","minimum":1}},"repsMin":{"rule":{"type":"integer","minimum":1}},"repsMax":{"rule":{"type":"integer","minimum":1}},"loadPercent":{"rule":{"type":"number","minimum":1,"maximum":150}},"target":{"properties":{"loadValue":{"rule":{"type":["number","null"],"minimum":0}},"reps":{"rule":{"type":["integer","null"],"minimum":0}},"durationSeconds":{"rule":{"type":"integer","minimum":0}},"rpe":{"rule":{"type":["number","null"],"minimum":0,"maximum":10}}}},"effortValue":{"rule":{"type":"number","minimum":0}},"restSeconds":{"rule":{"type":"integer","minimum":0}},"restMinSeconds":{"rule":{"type":"integer","minimum":0}},"restMaxSeconds":{"rule":{"type":"integer","minimum":0}}}}}}}}}}}}},"MEDIA_MANIFEST":{"properties":{"assets":{"items":{"properties":{"durationSeconds":{"rule":{"type":"integer","minimum":1}},"byteSize":{"rule":{"type":"integer","format":"int64","minimum":1}},"expiresAt":{"rule":{"type":["string","null"],"format":"date-time"}},"offlineValidUntil":{"rule":{"type":["string","null"],"format":"date-time"}}}}}}},"READ_MODEL_EXERCISE_HISTORY":{"properties":{"entries":{"items":{"properties":{"performedAt":{"rule":{"type":"string","format":"date-time"}},"loadPercent":{"rule":{"type":"number","minimum":1,"maximum":150}},"actual":{"properties":{"loadValue":{"rule":{"type":["number","null"],"minimum":0}},"reps":{"rule":{"type":["integer","null"],"minimum":0}},"durationSeconds":{"rule":{"type":"integer","minimum":0}},"rpe":{"rule":{"type":["number","null"],"minimum":0,"maximum":10}}}}}}}}}}}}}},"ExerciseHistorySyncView":{"properties":{"entries":{"items":{"properties":{"performedAt":{"rule":{"type":"string","format":"date-time"}},"loadPercent":{"rule":{"type":"number","minimum":1,"maximum":150}},"actual":{"properties":{"loadValue":{"rule":{"type":["number","null"],"minimum":0}},"reps":{"rule":{"type":["integer","null"],"minimum":0}},"durationSeconds":{"rule":{"type":"integer","minimum":0}},"rpe":{"rule":{"type":["number","null"],"minimum":0,"maximum":10}}}}}}}}},"PrescribedWorkoutSyncView":{"properties":{"exercises":{"items":{"properties":{"position":{"rule":{"type":"integer","minimum":1}},"sets":{"items":{"properties":{"setIndex":{"rule":{"type":"integer","minimum":1}},"repsMin":{"rule":{"type":"integer","minimum":1}},"repsMax":{"rule":{"type":"integer","minimum":1}},"loadPercent":{"rule":{"type":"number","minimum":1,"maximum":150}},"target":{"properties":{"loadValue":{"rule":{"type":["number","null"],"minimum":0}},"reps":{"rule":{"type":["integer","null"],"minimum":0}},"durationSeconds":{"rule":{"type":"integer","minimum":0}},"rpe":{"rule":{"type":["number","null"],"minimum":0,"maximum":10}}}},"effortValue":{"rule":{"type":"number","minimum":0}},"restSeconds":{"rule":{"type":"integer","minimum":0}},"restMinSeconds":{"rule":{"type":"integer","minimum":0}},"restMaxSeconds":{"rule":{"type":"integer","minimum":0}}}}}}}}}},"OfflineWorkoutBundle":{"properties":{"generatedAt":{"rule":{"type":"string","format":"date-time"}},"items":{"items":{"properties":{"asOf":{"rule":{"type":["string","null"],"format":"date-time"}},"view":{"tagged":{"property":"viewType","cases":{"WORKOUT_SESSION":{"properties":{"startedAt":{"rule":{"type":"string","format":"date-time"}},"calculatedLoadTargets":{"items":{"properties":{"loadPercent":{"rule":{"type":"number","minimum":1,"maximum":150}},"loadValue":{"rule":{"type":"number","minimum":1}}}}}}},"EXERCISE_EXECUTION":{"properties":{"prescribedPosition":{"rule":{"type":"integer","minimum":1}},"executedPosition":{"rule":{"type":"integer","minimum":1}}}},"SET_EXECUTION":{"properties":{"setIndex":{"rule":{"type":"integer","minimum":1}},"target":{"properties":{"loadValue":{"rule":{"type":["number","null"],"minimum":0}},"reps":{"rule":{"type":["integer","null"],"minimum":0}},"durationSeconds":{"rule":{"type":"integer","minimum":1}},"expectedRpe":{"rule":{"type":["number","null"],"minimum":0,"maximum":10}}}},"actual":{"alternatives":[{"properties":{"loadValue":{"rule":{"type":["number","null"],"minimum":0}},"reps":{"rule":{"type":["integer","null"],"minimum":0}},"durationSeconds":{"rule":{"type":"integer","minimum":0}},"rpe":{"rule":{"type":["number","null"],"minimum":0,"maximum":10}}}}]},"activeDurationSeconds":{"rule":{"type":"integer","format":"int64","minimum":0,"maximum":9007199254740991}},"measuredDurationSeconds":{"rule":{"type":"integer","minimum":1}},"adjustedDurationSeconds":{"rule":{"type":"integer","minimum":1}},"startedAt":{"rule":{"type":"string","format":"date-time"}},"completedAt":{"rule":{"type":"string","format":"date-time"}}}},"REST_PERIOD":{"properties":{"targetSeconds":{"rule":{"type":"integer","minimum":0}},"adjustedTargetSeconds":{"rule":{"type":"integer","minimum":0}},"measuredSeconds":{"rule":{"type":"integer","minimum":0}},"startedAt":{"rule":{"type":"string","format":"date-time"}},"endedAt":{"rule":{"type":"string","format":"date-time"}}}},"SUBSTITUTION":{"properties":{"registeredAt":{"rule":{"type":"string","format":"date-time"}}}},"DEFERRAL":{"properties":{"prescribedPosition":{"rule":{"type":"integer","minimum":1}},"executedPosition":{"rule":{"type":"integer","minimum":1}}}},"SET_AMENDMENT":{"properties":{"previous":{"properties":{"loadValue":{"rule":{"type":["number","null"],"minimum":0}},"reps":{"rule":{"type":["integer","null"],"minimum":0}},"durationSeconds":{"rule":{"type":"integer","minimum":0}},"rpe":{"rule":{"type":["number","null"],"minimum":0,"maximum":10}}}},"replacement":{"alternatives":[{"properties":{"loadValue":{"rule":{"type":["number","null"],"minimum":0}},"reps":{"rule":{"type":["integer","null"],"minimum":0}},"durationSeconds":{"rule":{"type":"integer","minimum":0}},"rpe":{"rule":{"type":["number","null"],"minimum":0,"maximum":10}}}}]},"amendedAt":{"rule":{"type":"string","format":"date-time"}}}},"DISCOMFORT_REPORT":{"properties":{"intensity":{"rule":{"type":"integer","minimum":0,"maximum":10}},"reportedAt":{"rule":{"type":"string","format":"date-time"}}}},"PRESCRIPTION_VERSION":{"properties":{"publishedAt":{"rule":{"type":"string","format":"date-time"}},"workouts":{"items":{"properties":{"exercises":{"items":{"properties":{"position":{"rule":{"type":"integer","minimum":1}},"sets":{"items":{"properties":{"setIndex":{"rule":{"type":"integer","minimum":1}},"repsMin":{"rule":{"type":"integer","minimum":1}},"repsMax":{"rule":{"type":"integer","minimum":1}},"loadPercent":{"rule":{"type":"number","minimum":1,"maximum":150}},"target":{"properties":{"loadValue":{"rule":{"type":["number","null"],"minimum":0}},"reps":{"rule":{"type":["integer","null"],"minimum":0}},"durationSeconds":{"rule":{"type":"integer","minimum":0}},"rpe":{"rule":{"type":["number","null"],"minimum":0,"maximum":10}}}},"effortValue":{"rule":{"type":"number","minimum":0}},"restSeconds":{"rule":{"type":"integer","minimum":0}},"restMinSeconds":{"rule":{"type":"integer","minimum":0}},"restMaxSeconds":{"rule":{"type":"integer","minimum":0}}}}}}}}}}}}},"MEDIA_MANIFEST":{"properties":{"assets":{"items":{"properties":{"durationSeconds":{"rule":{"type":"integer","minimum":1}},"byteSize":{"rule":{"type":"integer","format":"int64","minimum":1}},"expiresAt":{"rule":{"type":["string","null"],"format":"date-time"}},"offlineValidUntil":{"rule":{"type":["string","null"],"format":"date-time"}}}}}}},"READ_MODEL_EXERCISE_HISTORY":{"properties":{"entries":{"items":{"properties":{"performedAt":{"rule":{"type":"string","format":"date-time"}},"loadPercent":{"rule":{"type":"number","minimum":1,"maximum":150}},"actual":{"properties":{"loadValue":{"rule":{"type":["number","null"],"minimum":0}},"reps":{"rule":{"type":["integer","null"],"minimum":0}},"durationSeconds":{"rule":{"type":"integer","minimum":0}},"rpe":{"rule":{"type":["number","null"],"minimum":0,"maximum":10}}}}}}}}}}}}}}}}},"PrescriptionVersionSyncView":{"properties":{"publishedAt":{"rule":{"type":"string","format":"date-time"}},"workouts":{"items":{"properties":{"exercises":{"items":{"properties":{"position":{"rule":{"type":"integer","minimum":1}},"sets":{"items":{"properties":{"setIndex":{"rule":{"type":"integer","minimum":1}},"repsMin":{"rule":{"type":"integer","minimum":1}},"repsMax":{"rule":{"type":"integer","minimum":1}},"loadPercent":{"rule":{"type":"number","minimum":1,"maximum":150}},"target":{"properties":{"loadValue":{"rule":{"type":["number","null"],"minimum":0}},"reps":{"rule":{"type":["integer","null"],"minimum":0}},"durationSeconds":{"rule":{"type":"integer","minimum":0}},"rpe":{"rule":{"type":["number","null"],"minimum":0,"maximum":10}}}},"effortValue":{"rule":{"type":"number","minimum":0}},"restSeconds":{"rule":{"type":"integer","minimum":0}},"restMinSeconds":{"rule":{"type":"integer","minimum":0}},"restMaxSeconds":{"rule":{"type":"integer","minimum":0}}}}}}}}}}}}}}"#.utf8))) as! [String:[String:Any]]
    override func decode<T>(_ type: T.Type,from data: Data) throws -> T where T: Decodable {
        let name: String?
        if type == WorkoutControlFactReference.self { name="WorkoutControlFactReference" }
        else if type == WorkoutControlReceipt.self { name="WorkoutControlReceipt" }
        else if type == WorkoutControlProblemDetails.self { name="WorkoutControlProblemDetails" }
        else if type == WorkoutControlValues.self { name="WorkoutControlValues" }
        else if type == WorkoutControlOccurrenceRef.self { name="WorkoutControlOccurrenceRef" }
        else if type == WorkoutControlBeginSetPayload.self { name="WorkoutControlBeginSetPayload" }
        else if type == WorkoutControlCompleteSetPayload.self { name="WorkoutControlCompleteSetPayload" }
        else if type == WorkoutControlSkipSetPayload.self { name="WorkoutControlSkipSetPayload" }
        else if type == WorkoutControlEndRestAndBeginPayload.self { name="WorkoutControlEndRestAndBeginPayload" }
        else if type == WorkoutControlApplyValuesPayload.self { name="WorkoutControlApplyValuesPayload" }
        else if type == WorkoutControlAdjustRestTargetPayload.self { name="WorkoutControlAdjustRestTargetPayload" }
        else if type == WorkoutControlPausePayload.self { name="WorkoutControlPausePayload" }
        else if type == WorkoutControlResumePayload.self { name="WorkoutControlResumePayload" }
        else if type == WorkoutControlAmendLastSetPayload.self { name="WorkoutControlAmendLastSetPayload" }
        else if type == WorkoutControlActionRequest.self { name="WorkoutControlActionRequest" }
        else if type == WorkoutControlEntryValues.self { name="WorkoutControlEntryValues" }
        else if type == WorkoutControlInactivity.self { name="WorkoutControlInactivity" }
        else if type == WorkoutControlLastSet.self { name="WorkoutControlLastSet" }
        else if type == WorkoutControlOccurrence.self { name="WorkoutControlOccurrence" }
        else if type == WorkoutControlOpenSet.self { name="WorkoutControlOpenSet" }
        else if type == WorkoutControlRest.self { name="WorkoutControlRest" }
        else if type == WorkoutControlTimer.self { name="WorkoutControlTimer" }
        else if type == WorkoutControlView.self { name="WorkoutControlView" }
        else if type == WorkoutControlActionRequestOneOf.self { name="WorkoutControlActionRequestOneOf" }
        else if type == WorkoutControlActionRequestOneOf1.self { name="WorkoutControlActionRequestOneOf1" }
        else if type == WorkoutControlActionRequestOneOf2.self { name="WorkoutControlActionRequestOneOf2" }
        else if type == WorkoutControlActionRequestOneOf3.self { name="WorkoutControlActionRequestOneOf3" }
        else if type == WorkoutControlActionRequestOneOf4.self { name="WorkoutControlActionRequestOneOf4" }
        else if type == WorkoutControlActionRequestOneOf5.self { name="WorkoutControlActionRequestOneOf5" }
        else if type == WorkoutControlActionRequestOneOf6.self { name="WorkoutControlActionRequestOneOf6" }
        else if type == WorkoutControlActionRequestOneOf7.self { name="WorkoutControlActionRequestOneOf7" }
        else if type == WorkoutControlActionRequestOneOf8.self { name="WorkoutControlActionRequestOneOf8" }
        else if type == StudentTodayCardOpenSessionView.self { name="StudentTodayCardOpenSessionView" }
        else if type == StudentTodayWorkoutCardView.self { name="StudentTodayWorkoutCardView" }
        else if type == SetExecutionSyncView.self { name="SetExecutionSyncView" }
        else if type == PrescribedSetSyncView.self { name="PrescribedSetSyncView" }
        else if type == ExecutionTargetValues.self { name="ExecutionTargetValues" }
        else if type == WorkoutSetValues.self { name="WorkoutSetValues" }
        else if type == WorkoutCoreSyncView.self { name="WorkoutCoreSyncView" }
        else if type == SetAmendmentSyncView.self { name="SetAmendmentSyncView" }
        else if type == ExerciseHistoryEntry.self { name="ExerciseHistoryEntry" }
        else if type == PrescribedExerciseSyncView.self { name="PrescribedExerciseSyncView" }
        else if type == OfflineWorkoutBundleItem.self { name="OfflineWorkoutBundleItem" }
        else if type == ExerciseHistorySyncView.self { name="ExerciseHistorySyncView" }
        else if type == PrescribedWorkoutSyncView.self { name="PrescribedWorkoutSyncView" }
        else if type == OfflineWorkoutBundle.self { name="OfflineWorkoutBundle" }
        else if type == PrescriptionVersionSyncView.self { name="PrescriptionVersionSyncView" }
        else { name=nil }
        if let name=name,let projection=Self.projections[name] {
            var parser=WorkoutControlJSONParser(data)
            let raw=try parser.parse()
            guard try Self.validate(projection,raw) else { throw DecodingError.dataCorrupted(.init(codingPath:[],debugDescription:"Invalid exact workout control JSON")) }
        }
        return try super.decode(type,from:data)
    }
    private static func validate(_ p:[String:Any],_ v:Any) throws -> Bool {
        if let tagged=p["tagged"] as? [String:Any],let key=tagged["property"] as? String,
           let fields=v as? [String:Any],let tag=fields[key] as? String,
           let cases=tagged["cases"] as? [String:[String:Any]],let selected=cases[tag] {
            if try !validate(selected,v) {return false}
        }
        if let name=p["wwc"] as? String {
            guard WorkoutControlWireGuard.accepts(name,v) else {return false}
            try WorkoutControlWireGuard.requireNativeRepresentation(name,v)
            return true
        }
        if let rule=p["rule"] as? [String:Any] {
            guard WorkoutControlWireGuard.acceptsRule(rule,v) else {return false}
            try WorkoutControlWireGuard.requireNativeRule(rule,v)
        }
        if let fields=v as? [String:Any],let properties=p["properties"] as? [String:[String:Any]] {
            for (key,value) in fields { if let child=properties[key] { if try !validate(child,value) {return false} } }
        }
        if let values=v as? [Any],let item=p["items"] as? [String:Any] {
            for value in values {if try !validate(item,value) {return false}}
        }
        if let alternatives=p["alternatives"] as? [[String:Any]] {
            for child in alternatives {if try !validate(child,v) {return false}}
        }
        return true
    }
}

/// Exact decimal ordering/integrality. No conversion through Double or Decimal.
struct WorkoutControlJSONNumber {
    private let negative: Bool
    private let digits: String
    private let power: Int
    private let position: Int
    var isInteger: Bool { digits == "0" || power >= 0 }
    init?(_ literal:String) {
        let pattern="(-?)(0|[1-9][0-9]*)(?:[.]([0-9]+))?(?:[eE]([+-]?[0-9]+))?"
        let full=NSRange(location:0,length:literal.utf16.count)
        guard let re=try? NSRegularExpression(pattern:pattern),let m=re.firstMatch(in:literal,range:full),m.range == full else { return nil }
        func part(_ n:Int)->String { let r=m.range(at:n);return r.location == NSNotFound ? "" : (literal as NSString).substring(with:r) }
        let fraction=part(3)
        var significant=String((part(2)+fraction).drop(while:{$0 == "0"}))
        if significant.isEmpty { negative=false;digits="0";power=0;position=1;return }
        guard let exponent=Int(part(4).isEmpty ? "0" : part(4)) else { return nil }
        let (initial,underflow)=exponent.subtractingReportingOverflow(fraction.count)
        guard !underflow else { return nil }
        var zeros=0
        while significant.last == "0" { significant.removeLast();zeros+=1 }
        let (scale,overflow)=initial.addingReportingOverflow(zeros)
        let (pos,positionOverflow)=scale.addingReportingOverflow(significant.count)
        guard !overflow && !positionOverflow else { return nil }
        negative=part(1) == "-";digits=significant;power=scale;position=pos
    }
    func survivesDoubleWireRoundTrip() -> Bool {
        let literal=(negative ? "-" : "")+digits+"e"+String(power)
        guard let native=Double(literal),native.isFinite,
              let data=try? JSONEncoder().encode(native),let wire=String(data:data,encoding:.utf8),
              let emitted=Self(wire) else {return false}
        return compare(emitted) == 0
    }
    func compare(_ other:Self)->Int {
        if digits == "0" && other.digits == "0" { return 0 }
        if negative != other.negative { return negative ? -1 : 1 }
        let magnitude:Int
        if digits == "0" { magnitude = -1 }
        else if other.digits == "0" { magnitude = 1 }
        else if position != other.position { magnitude = position < other.position ? -1 : 1 }
        else {
            let length=max(digits.count,other.digits.count)
            let a=digits+String(repeating:"0",count:length-digits.count)
            let b=other.digits+String(repeating:"0",count:length-other.digits.count)
            magnitude=a == b ? 0 : (a < b ? -1 : 1)
        }
        return negative ? -magnitude : magnitude
    }
}

/// Byte parser used only before decoding the WWC-bearing SDK roots above.
private struct WorkoutControlJSONParser {
    private let bytes:[UInt8]
    private var offset=0
    init(_ data:Data) { bytes=Array(data) }
    private func error()->DecodingError { .dataCorrupted(.init(codingPath:[],debugDescription:"Invalid exact workout control JSON")) }
    private mutating func space() { while offset < bytes.count && [9,10,13,32].contains(bytes[offset]) { offset+=1 } }
    private mutating func consume(_ byte:UInt8)->Bool { space();if offset < bytes.count && bytes[offset] == byte { offset+=1;return true };return false }
    mutating func parse() throws -> Any { let v=try value(0);space();guard offset == bytes.count else {throw error()};return v }
    private mutating func string() throws -> String {
        space();let start=offset
        guard offset < bytes.count && bytes[offset] == 34 else {throw error()};offset+=1
        var escaped=false
        while offset < bytes.count {
            let byte=bytes[offset];offset+=1
            if !escaped && byte == 34 {
                let data=Data(bytes[start..<offset])
                guard let result=try JSONSerialization.jsonObject(with:data,options:.fragmentsAllowed) as? String else {throw error()}
                return result
            }
            if !escaped && byte < 32 {throw error()}
            if !escaped && byte == 92 { escaped=true } else { escaped=false }
        }
        throw error()
    }
    private mutating func value(_ depth:Int) throws -> Any {
        // Foundation's decoder has the same finite nesting boundary. Every
        // approved acyclic WWC schema is far shallower; failure stays explicit.
        guard depth < 512 else {throw error()};space();guard offset < bytes.count else {throw error()}
        let byte=bytes[offset]
        if byte == 34 {return try string()}
        if byte == 123 {
            offset+=1;var fields:[String:Any]=[:]
            if consume(125) {return fields}
            repeat {
                let key=try string();guard fields[key] == nil && consume(58) else {throw error()}
                fields[key]=try value(depth+1)
                if consume(125) {return fields}
                guard consume(44) else {throw error()}
            } while true
        }
        if byte == 91 {
            offset+=1;var items:[Any]=[]
            if consume(93) {return items}
            repeat { items.append(try value(depth+1));if consume(93) {return items};guard consume(44) else {throw error()} } while true
        }
        for (word,result) in [("true",true as Any),("false",false as Any),("null",NSNull() as Any)] {
            let token=Array(word.utf8)
            if offset+token.count <= bytes.count && Array(bytes[offset..<offset+token.count]) == token {offset+=token.count;return result}
        }
        let start=offset
        while offset < bytes.count && ((48...57).contains(bytes[offset]) || [43,45,46,69,101].contains(bytes[offset])) {offset+=1}
        guard offset > start,let literal=String(bytes:bytes[start..<offset],encoding:.utf8),let number=WorkoutControlJSONNumber(literal) else {throw error()}
        return number
    }
}
