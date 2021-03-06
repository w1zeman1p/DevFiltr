DevFiltr.Views.AssessmentsIndex = Backbone.View.extend({
	initialize: function () {
		this.listenTo(this.collection, "all", this.render);
	},
	
  template: JST['assessments/index'],
	
	render: function () {		
		var renderedContent = this.template({
			assessments: this.collection
		});
		
		this.$el.html(renderedContent);
		return this;
	},
});
