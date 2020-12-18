import FroalaEditor from 'froala-editor'
import 'froala-editor/js/plugins/align.min.js'
import 'froala-editor/js/plugins/colors.min.js'
import 'froala-editor/js/plugins/code_beautifier.min.js'
import 'froala-editor/js/plugins/code_view.min.js'
import 'froala-editor/js/plugins/draggable.min.js'
import 'froala-editor/js/plugins/emoticons.min.js'
import 'froala-editor/js/plugins/entities.min.js'
import 'froala-editor/js/plugins/file.min.js'
import 'froala-editor/js/plugins/image.min.js'
import 'froala-editor/js/plugins/image_manager.min.js'
import "froala-editor/js/plugins/font_family.min.js"
import "froala-editor/js/plugins/font_size.min.js"
import "froala-editor/js/plugins/image.min.js"
import "froala-editor/js/plugins/image_manager.min.js"
import "froala-editor/js/plugins/paragraph_format.min.js"
import "froala-editor/js/plugins/paragraph_style.min.js"
import "froala-editor/js/plugins/save.min.js"
import "froala-editor/js/plugins/url.min.js"
import "froala-editor/js/plugins/video.min.js"
import 'froala-editor/js/languages/zh_tw.js'
// import 'froala-editor/js/plugins/';




document.addEventListener('turbolinks:load',function(event){
    let editor = new FroalaEditor('#story_content', { 
        language: 'zh_tw',
        spellcheck: false,
        imageUploadURL: '/api/upload_image'
    })
})