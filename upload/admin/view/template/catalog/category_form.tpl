<?php echo $header; ?>
<div id="content">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($error_warning) { ?>
  <div class="alert alert-error"><i class="icon-exclamation-sign"></i> <?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="page-header">
      <h1><i class="icon-edit"></i> <?php echo $heading_title; ?></h1>
    </div>
    <div class="box-content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <ul class="nav nav-tabs">
          <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
          <li><a href="#tab-data" data-toggle="tab"><?php echo $tab_data; ?></a></li>
          <li><a href="#tab-design" data-toggle="tab"><?php echo $tab_design; ?></a></li>
        </ul>
        <div class="tab-content">
          <div class="tab-pane active" id="tab-general">
            <ul class="nav nav-tabs" id="language">
              <?php foreach ($languages as $language) { ?>
              <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
              <?php } ?>
            </ul>
            <div class="tab-content">
              <?php foreach ($languages as $language) { ?>
              <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
                <div class="control-group required">
                  <label class="control-label" for="input-name<?php echo $language['language_id']; ?>"><span class="required">*</span> <?php echo $entry_name; ?></label>
                  <div class="controls">
                    <input type="text" name="category_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($category_description[$language['language_id']]) ? $category_description[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name<?php echo $language['language_id']; ?>" class="input-xxlarge" />
                    <?php if (isset($error_name[$language['language_id']])) { ?>
                    <span class="error"><?php echo $error_name[$language['language_id']]; ?></span>
                    <?php } ?>
                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label" for="input-meta-description<?php echo $language['language_id']; ?>"><?php echo $entry_meta_description; ?></label>
                  <div class="controls">
                    <textarea name="category_description[<?php echo $language['language_id']; ?>][meta_description]" cols="40" rows="5" placeholder="<?php echo $entry_meta_description; ?>" id="input-meta-description<?php echo $language['language_id']; ?>"><?php echo isset($category_description[$language['language_id']]) ? $category_description[$language['language_id']]['meta_description'] : ''; ?></textarea>
                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label" for="input-meta-keyword<?php echo $language['language_id']; ?>"><?php echo $entry_meta_keyword; ?></label>
                  <div class="controls">
                    <textarea name="category_description[<?php echo $language['language_id']; ?>][meta_keyword]" cols="40" rows="5" placeholder="<?php echo $entry_meta_keyword; ?>" id="input-meta-keyword<?php echo $language['language_id']; ?>"><?php echo isset($category_description[$language['language_id']]) ? $category_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea>
                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
                  <div class="controls">
                    <textarea name="category_description[<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $language['language_id']; ?>"><?php echo isset($category_description[$language['language_id']]) ? $category_description[$language['language_id']]['description'] : ''; ?></textarea>
                  </div>
                </div>
              </div>
              <?php } ?>
            </div>
          </div>
          <div class="tab-pane" id="tab-data">
            <div class="control-group">
              <label class="control-label" for="input-parent"><?php echo $entry_parent; ?></label>
              <div class="controls">
                <input type="text" name="path" value="<?php echo $path; ?>" placeholder="<?php echo $entry_parent; ?>" id="input-parent" />
                <input type="hidden" name="parent_id" value="<?php echo $parent_id; ?>" />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="input-filter"><?php echo $entry_filter; ?></label>
              <div class="controls">
                <input type="text" name="filter" value="" placeholder="<?php echo $entry_filter; ?>" id="input-filter" />
                <a data-toggle="tooltip"><?php echo $help_filter; ?></a>
                <div id="category-filter">
                  <?php foreach ($category_filters as $category_filter) { ?>
                  <div id="category-filter<?php echo $category_filter['filter_id']; ?>"><?php echo $category_filter['name']; ?><img src="view/image/icon-delete.png" alt="" />
                    <input type="hidden" name="category_filter[]" value="<?php echo $category_filter['filter_id']; ?>" />
                  </div>
                  <?php } ?>
                </div>
              </div>
            </div>
            <div class="control-group">
              <div class="control-label"><?php echo $entry_store; ?></div>
              <div class="controls">
                <label class="checkbox">
                  <?php if (in_array(0, $category_store)) { ?>
                  <input type="checkbox" name="category_store[]" value="0" checked="checked" />
                  <?php echo $text_default; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="category_store[]" value="0" />
                  <?php echo $text_default; ?>
                  <?php } ?>
                </label>
                <?php foreach ($stores as $store) { ?>
                <label class="checkbox">
                  <?php if (in_array($store['store_id'], $category_store)) { ?>
                  <input type="checkbox" name="category_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                  <?php echo $store['name']; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="category_store[]" value="<?php echo $store['store_id']; ?>" />
                  <?php echo $store['name']; ?>
                  <?php } ?>
                </label>
                <?php } ?>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="input-keyword"><?php echo $entry_keyword; ?></label>
              <div class="controls">
                <input type="text" name="keyword" value="<?php echo $keyword; ?>" placeholder="<?php echo $entry_keyword; ?>" id="input-keyword" />
                <i id="help-keyword" class="icon-question-sign"></i> 
                <script type="text/javascript"><!--
                $('#help-keyword').tooltip({'title': '<?php echo addslashes($help_keyword); ?>', trigger: 'hover'});
                //--></script> 
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="input-name"><?php echo $entry_image; ?></label>
              <div class="controls">
                
            
                
                <img src="<?php echo $thumb; ?>" alt="" id="thumb" class="img-polaroid" />
                  
                   <br /><br />
                  <div class="btn-group">
<button class="btn btn-small"><i class="icon-edit"></i></button>
<button class="btn btn-small"><i class="icon-remove"></i></button>
</div>               
 
                  
                  <input type="hidden" name="image" value="<?php echo $image; ?>" id="image" />
                  
                  
                 
                  
                  
                  

                  
                  
                  <a onclick="image_upload('image', 'thumb');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb').attr('src', '<?php echo $no_image; ?>'); $('#image').attr('value', '');"><?php echo $text_clear; ?></a>
                  
                  
                  
                 
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="input-top"><?php echo $entry_top; ?></label>
              <div class="controls">
                <label class="checkbox inline">
                  <?php if ($top) { ?>
                  <input type="checkbox" name="top" value="1" checked="checked" id="input-top" />
                  <?php } else { ?>
                  <input type="checkbox" name="top" value="1" id="input-top" />
                  <?php } ?>
                </label>
                <i id="help-top" class="icon-question-sign"></i> 
                <script type="text/javascript"><!--
                $('#help-top').tooltip({'title': '<?php echo addslashes($help_top); ?>', trigger: 'hover'});
                //--></script> 
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="input-column"><?php echo $entry_column; ?></label>
              <div class="controls">
                <input type="text" name="column" value="<?php echo $column; ?>" placeholder="<?php echo $entry_column; ?>" id="input-column" class="input-mini" />
                <i id="help-column" class="icon-question-sign"></i> 
                <script type="text/javascript"><!--
                $('#help-column').tooltip({'title': '<?php echo addslashes($help_column); ?>', trigger: 'hover'});
                //--></script> 
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
              <div class="controls">
                <input type="text" name="sort_order" value="<?php echo $sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="input-mini" />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="input-status"><?php echo $entry_status; ?></label>
              <div class="controls">
                <select name="status" id="input-status">
                  <?php if ($status) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
              </div>
            </div>
          </div>
          <div class="tab-pane" id="tab-design">
            <table class="table table-striped table-bordered table-hover">
              <thead>
                <tr>
                  <td class="left"><?php echo $entry_store; ?></td>
                  <td class="left"><?php echo $entry_layout; ?></td>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td class="left"><?php echo $text_default; ?></td>
                  <td class="left"><select name="category_layout[0][layout_id]">
                      <option value=""></option>
                      <?php foreach ($layouts as $layout) { ?>
                      <?php if (isset($category_layout[0]) && $category_layout[0] == $layout['layout_id']) { ?>
                      <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                      <?php } ?>
                      <?php } ?>
                    </select></td>
                </tr>
              </tbody>
              <?php foreach ($stores as $store) { ?>
              <tbody>
                <tr>
                  <td class="left"><?php echo $store['name']; ?></td>
                  <td class="left"><select name="category_layout[<?php echo $store['store_id']; ?>][layout_id]">
                      <option value=""></option>
                      <?php foreach ($layouts as $layout) { ?>
                      <?php if (isset($category_layout[$store['store_id']]) && $category_layout[$store['store_id']] == $layout['layout_id']) { ?>
                      <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                      <?php } ?>
                      <?php } ?>
                    </select></td>
                </tr>
              </tbody>
              <?php } ?>
            </table>
          </div>
        </div>
        <div class="form-actions">
          <button type="submit" class="btn btn-primary"><i class="icon-ok"></i> <?php echo $button_save; ?></button>
          <a href="<?php echo $cancel; ?>" class="btn"><i class="icon-remove"></i> <?php echo $button_cancel; ?></a></div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
CKEDITOR.replace('input-description<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
<?php } ?>
//--></script> 
<script type="text/javascript"><!--
$('input[name=\'path\']').typeahead({
	source: function(query, process) {
		$.ajax({
			url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(query),
			dataType: 'html',
			success: function(json) {
				/*
				json.unshift({
					'category_id':  0,
					'name':  '<?php echo $text_none; ?>'
				});
				
			
				data = [];
				
				for () {
					
				}
			
				process(JSON.parse(json));	
				*/
									
			}
		});		
		
		
	},
	"key": "city", 
    "value": "code", 	
	updater: function (item) {
    	selectedState = map[item].stateCode;
   		
		return item;
	}
})
/*
$('input[name=\'path\']').on('keydown', function() {
	$.ajax({
		url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(this.value),
		dataType: 'json',
		success: function(json) {
			json.unshift({
				'category_id':  0,
				'name':  '<?php echo $text_none; ?>'
			});
				
			$('input[name=\'path\']').trigger("liszt:updated");
		}
	});

});


$('input[name=\'path\']').autocomplete({
	delay: 500,
	source: function(request, response) {		
		$.ajax({
			url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {
				json.unshift({
					'category_id':  0,
					'name':  '<?php echo $text_none; ?>'
				});
				
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.category_id
					}
				}));
			}
		});
	},
	select: function(event, ui) {
		$('input[name=\'path\']').val(ui.item.label);
		$('input[name=\'parent_id\']').val(ui.item.value);
		
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});
*/
//--></script> 
<script type="text/javascript"><!--
/*
// Filter
$('input[name=\'filter\']').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/filter/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.filter_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('#category-filter' + ui.item.value).remove();
		
		$('#category-filter').append('<div id="category-filter' + ui.item.value + '">' + ui.item.label + '<img src="view/image/icon-delete.png" alt="" /><input type="hidden" name="category_filter[]" value="' + ui.item.value + '" /></div>');

		$('#category-filter div:odd').attr('class', 'odd');
		$('#category-filter div:even').attr('class', 'even');
				
		return false;
	},
	focus: function(event, ui) {
      return false;
   }
});

$('#category-filter div img').on('click', function() {
	$(this).parent().remove();
	
	$('#category-filter div:odd').attr('class', 'odd');
	$('#category-filter div:even').attr('class', 'even');	
});
*/
//--></script> 
<script type="text/javascript"><!--
function image_upload(field, thumb) {
	$('#dialog').remove();
	
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).val()),
					dataType: 'text',
					success: function(data) {
						$('#' + thumb).replaceWith('<img src="' + data + '" alt="" id="' + thumb + '" />');
					}
				});
			}
		},	
		bgiframe: false,
		width: 800,
		height: 400,
		resizable: false,
		modal: false
	});
};
//--></script> 
<script type="text/javascript"><!--
$('#language a:first').tab('show');
//--></script> 
<?php echo $footer; ?>