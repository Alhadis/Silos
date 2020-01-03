&if defined(static) > 0 and defined(reference-only) > 0 &then &undefine reference-only
&endif

&if "{&do-undo}"         <> "true" &then &scop no-undo no-undo
&endif

&if "{&no-rcode-info}"   <> "true" &then &scop rcode-information rcode-information
&endif

&if "{&no-before-table}" <> "true" &then &scop before-table before-table btTt~{~&ttPrefix~}BulkDeleteSummary~{~&ttSuffix~}
&endif

&if "{&TtAllDefined}"     > "" &then &glob TtAllDefined {&TtAllDefined},
&endif

&glob TtAllDefined {&TtAllDefined} ~{~&TtBufferPrefix~}tt~{~&ttPrefix~}BulkDeleteSummary~{~&ttSuffix~}

&if defined(tt{&ttPrefix}BulkDeleteSummary{&ttSuffix}) = 0 &then
&glob tt{&ttPrefix}BulkDeleteSummary{&ttSuffix} true
define {&protected} {&static} temp-table tt{&ttPrefix}BulkDeleteSummary{&ttSuffix} {&no-undo} {&reference-only} {&rcode-information} {&before-table}
  field iRecordsRead         as int   label "Records read"
  field iRecordsDeleted      as int   label "Records deleted"
  field iRecordsLocked       as int   label "Records locked"
  {&ttExtraFields}
  {&ttExtraIndices}
  .

&endif
/* eof */
