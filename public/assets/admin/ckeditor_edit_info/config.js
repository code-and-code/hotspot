CKEDITOR.editorConfig = function( config ) {

	config.language = 'pt-br';

	config.height = '100%';

	config.extraPlugins = 'savebtn';//savebtn is the plugin's name
	config.saveSubmitURL = 'http://localhost:8080/information/update';//link to serverside script to handle the post

	config.toolbarGroups = [
		{ name: 'document',	   groups: [ 'mode', 'document', 'doctools' ] },
		{ name: 'clipboard',   groups: [ 'clipboard', 'undo' ] },
		{ name: 'editing',     groups: [ 'find', 'selection', 'spellchecker' ] },
		{ name: 'forms' },
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
		{ name: 'paragraph',   groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ] },
		{ name: 'links' },
		{ name: 'insert' },
		{ name: 'styles' },
		{ name: 'colors' },
		{ name: 'tools' },
		{ name: 'others' },
		{ name: 'about' }
	];

	config.removeDialogTabs = 'link:advanced';
};
