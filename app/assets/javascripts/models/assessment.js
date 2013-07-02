DevFiltr.Models.Assessment = Backbone.Model.extend({
	parse: function (data) {
		var assessment_attempts = new DevFiltr.Collections.AssessmentAttempts(data.assessment_attempts);
		delete data.assessment_attempts;
		var newData = data;
		newData.assessment_attempts = assessment_attempts;
		return newData;
	},
});