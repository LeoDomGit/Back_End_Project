import React, { useEffect } from 'react';

const CKEditor = ({ onChange, value }) => {
    useEffect(() => {
        // Check if CKEDITOR is available
        if (window.CKEDITOR) {
            const options = {
                filebrowserImageBrowseUrl: '/laravel-filemanager?type=Images',
                filebrowserImageUploadUrl: '/laravel-filemanager/upload?type=Images&_token=',
                filebrowserBrowseUrl: '/laravel-filemanager?type=Files',
                filebrowserUploadUrl: '/laravel-filemanager/upload?type=Files&_token='
            };

            const ckeditor = window.CKEDITOR.replace('editor', options);
            ckeditor.config.height = 300;

            // Set initial value
            ckeditor.setData(value);

            // Handle change events
            ckeditor.on('change', () => {
                const data = ckeditor.getData();
                if (onChange) {
                    onChange(data);
                }
            });
        }

        // Cleanup function to destroy CKEditor instance on unmount
        return () => {
            if (window.CKEDITOR.instances.editor) {
                window.CKEDITOR.instances.editor.destroy(true);
            }
        };
    }, [onChange, value]);

    return (
        <textarea id="editor"></textarea>
    );
};

export default CKEditor;
