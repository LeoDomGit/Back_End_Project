import ButtonView from '@ckeditor/ckeditor5-ui/src/button/buttonview';
import { Plugin } from '@ckeditor/ckeditor5-core';

export default class FileManagerPlugin extends Plugin {
    init() {
        const editor = this.editor;

        editor.ui.componentFactory.add('fileManager', locale => {
            const view = new ButtonView(locale);

            view.set({
                label: 'File Manager',
                icon: '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 256"><rect width="256" height="256" fill="none"/><rect x="64" y="48" width="160" height="128" rx="8" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="16"/><circle cx="172" cy="84" r="12"/><path d="M64,128.69l38.34-38.35a8,8,0,0,1,11.32,0L163.31,140,189,114.34a8,8,0,0,1,11.31,0L224,138.06" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="16"/><path d="M192,176v24a8,8,0,0,1-8,8H40a8,8,0,0,1-8-8V88a8,8,0,0,1,8-8H64" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="16"/></svg>',
                tooltip: true,
                withText: true
            });

            view.on('execute', () => {
                window.open(
                    `${window.location.origin}/files?page=1&limit=50&path=/&embed=true`,
                    // `http://localhost:8000/files?page=1&limit=50&path=/&embed=true`,
                    "popup",
                    "width=2000,height=2000"
                );

                window.editor = this.editor;
                window.receiveDataFromPopup = function (imageUrl) {
                    const currentPosition =
                        window.editor.model.document.selection.getFirstPosition();

                    const viewFragment = window.editor.data.processor.toView(imageUrl);
                    const modelFragment = window.editor.data.toModel(viewFragment);

                    this.editor.model.insertContent(modelFragment, currentPosition);
                };
            });

            return view;
        });
    }
}
