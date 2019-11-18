lexer grammar MmLexer ;

/************************************
 * Manuscript Manager
 * version 2.0
 * Lexical Analyser of *.mm files
 ************************************/

Comment 
    : 
    ( '(*' .*? '*)'
    | '(#' .*? '#)'
    | '(%' .*? '%)'
    ) -> skip
    ;

WS : [ \t\r\n]+ -> skip ;

LParen : '(' -> pushMode(CommandMode);
fragment QString : '\'' .*? '\'' ;
fragment QQString : '"' .*? '"' ;
fragment NameString : [a-zA-Z0-9._-]+ ;
fragment Slash : [/\\] ;
fragment FileName : (Slash* NameString) '.' NameString ;
fragment SimpleString : ~('\'' | ["()])+ ;   

String 
    : 
    ( QString 
    | QQString 
    | NameString 
    | FileName 
    | SimpleString 
    )+
    ;

mode CommandMode ;
CommandWS : WS -> skip;
RParen : ')' -> popMode ;

RoleCommand      : 'Role'      -> mode(RoleCommandMode) ;
WaitCommand      : 'Wait'      -> mode(WaitCommandMode) ;
SoundCommand     : 'Sound'     -> mode(SoundCommandMode) ;
GroupCommand     : 'Group'     -> mode(GroupCommandMode) ;
PlayCommand      : 'Play'      -> mode(PlayCommandMode) ;
SettingsCommand  : 'Settings'  -> mode(SettingsCommandMode) ;
Call             : NameString -> mode(CallMode) ;

mode RoleCommandMode ;
RoleWS : WS -> skip;
RoleRParen : RParen -> popMode ;
RoleLParen : LParen ;

PitchRoleParam : 'pitch' -> pushMode(NumberTypeMode) ;
RateRoleParam  : 'rate'  -> pushMode(NumberTypeMode) ;
GainRoleParam  : 'gain'  -> pushMode(NumberTypeMode) ;
LangRoleParam  : 'lang'  -> pushMode(LanguageTypeMode) ;
AliasRoleParam : 'alias' -> pushMode(FullNameTypeMode) ;
RoleName       : NameString  ;

mode WaitCommandMode ;
WaitWS : WS -> skip;
WaitRParen : RParen -> popMode ;
WaitLParen : LParen ;
 
LengthWaitParam : 'length' -> pushMode(NumberTypeMode) ;
WaitName       : NameString ;

mode SoundCommandMode ;
SoundWS : WS -> skip;
SoundRParen : RParen -> popMode ;
SoundLParen : LParen ;

FromSoundParam : 'from' -> pushMode(SoundNameTypeMode) ;
GainSoundParam : 'gain' -> pushMode(NumberTypeMode) ;
SoundName : NameString  ;

mode GroupCommandMode ;
GroupWS : WS -> skip;
GroupRParen : RParen -> popMode ;
GroupLParen : LParen ;

MembersGroupParam : 'members' -> pushMode(SoundNameTypeMode) ;
GroupName : NameString ;

mode PlayCommandMode ;
PlayWS : WS -> skip;
PlayRParen : RParen -> popMode ;
PlayLParen : LParen ;

SoundPlayParam : 'SOUND' -> pushMode(SoundNameTypeMode) ;
GainPlayParam : 'gain' -> pushMode(NumberTypeMode) ;
PlayName : NameString ;

mode SettingsCommandMode ;
SettingsWS : WS -> skip;
SettingsRParen : RParen -> popMode ;
SettingsLParen : LParen ;

DefaultLanguageSettingsParam : 'defaultLanguage' -> pushMode(LanguageTypeMode) ; 
OutputSettingsParam : 'output' -> pushMode(SoundNameTypeMode) ; 

mode CallMode ;
CallWS : WS -> skip;
CallRParen : RParen -> popMode ;
CallLParen : LParen -> pushMode(StringMode);
CallString : String ;

mode NumberTypeMode ;
NumberWS : WS -> skip;
NumberRParen : RParen -> popMode ;
NumberValue : [+/-]?[0-9]+('.'[0-9]*)? ;

mode FullNameTypeMode ;
FullNameWS : WS -> skip;
FullNameRParen : RParen -> popMode ; 
FullNameValue : NameString (' ' NameString)* ;

mode BoolenTypeMode ;
BooleanWS : WS -> skip;
BooleanRParen : RParen -> popMode ; 
BooleanValue :'true' | 'false' ;

mode SoundNameTypeMode ;
SoundNameWS : WS -> skip;
SoundNameRParen : RParen -> popMode ;
SoundNameValue : FileName | NameString ;

mode LanguageTypeMode ;
LanguageWS : WS -> skip;
LanguageRParen : RParen -> popMode ;
LanguageValue : 'fi' | 'en' | 'sv' | 'fr' ;

mode StringMode ;
StringRParen : RParen -> popMode ;
StringValue : String (WS String)* ;
