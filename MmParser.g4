parser grammar MmParser ;

options {tokenVocab=MmLexer;}

/************************
 * Manuscript Manager
 * version 2.0
 * Parser of *.mm files
 ************************/

mm
    :
    ( Comment   # ohitetaan
    | String    # kertoja
    | command   # määrittelykomento vaiko definition?
    | call      # kutsu
    )*
    ;

command
    : roleCommand
    | waitCommand
    | soundCommand
    | groupCommand
    | playCommand
    | settingsCommand
    ;
 
roleCommand : LParen RoleCommand RoleName roleParameters RoleRParen ;   
roleParameters : roleParameter* ;
roleParameter
    : RoleLParen
    ( PitchRoleParam NumberValue NumberRParen
    | RateRoleParam NumberValue NumberRParen
    | GainRoleParam NumberValue NumberRParen
    | LangRoleParam LanguageValue NumberRParen
    | AliasRoleParam FullNameValue FullNameRParen
    ) 
    ;

waitCommand : LParen WaitCommand WaitName waitParameters WaitRParen ;   
waitParameters : waitParameter ;
waitParameter
    : WaitLParen LengthWaitParam NumberValue NumberRParen
    ;

soundCommand : LParen SoundCommand SoundName soundParameters SoundRParen ;
soundParameters : soundParameter* ;
soundParameter
    : SoundLParen
    ( BlockSoundParam  BooleanValue BooleanRParen
    | FromSoundParam  SoundName SoundNameRParen
    | GainSoundParam NumberValue NumberRParen
    )
    ;

groupCommand : LParen GroupCommand GroupName groupParameters GroupRParen ;
groupParameters : groupParameter* ;
groupParameter
    : GroupLParen
    ( MembersGroupParam SoundNameValue* SoundNameRParen
    | GainSoundParam NumberValue NumberRParen
    )
    ;

playCommand : LParen PlayCommand PlayName playParameters PlayRParen ;
playParameters : playParameter* ;
playParameter
    : PlayLParen
    ( SoundPlayParam SoundNameValue SoundNameRParen
    | GainSoundParam NumberValue NumberRParen
    )
    ;

settingsCommand : LParen SettingsCommand settingsParameters SettingsRParen ;
settingsParameters : settingsParameter* ;
settingsParameter
    : SettingsLParen
    ( DefaultLanguageSettingsParam LanguageValue LanguageRParen
    | OutputSettingsParam SoundNameValue SoundNameRParen
    )
    ;

call : LParen Call CallString? callParameters CallRParen ;
callParameters: callParameter* ;
callParameter : CallLParen StringValue StringRParen ;
