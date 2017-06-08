-- try to save all open files in all open apps
tell application "Atom"

    -- Save all on-disk text documents with un-saved changes.
    -- -----------------------------------------------------
    set open_documents to every document

    repeat with doc in open_documents

        try
            display notification "try save"
            set doc_name to ((name of doc) as string)
            save doc as document in file ("~/Desktop/" & doc_name)
        on error
            display notification "error"
            -- save doc
        end try

    end repeat

end tell
