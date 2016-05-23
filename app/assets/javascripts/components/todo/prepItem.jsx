var PrepItem = React.createClass({
  showPrep: function() {
    this.props.handleClick(this.props.prep);
  },
  toggleCompletion: function() {
    var prep = this.props.prep;
    prep.completed = !prep.completed;
    this.props.updatePrep(prep);
  },
  deletePrep: function() {
    this.props.deletePrep(this.props.prep);
  },
  render: function() {
    var body;
    if (this.props.prep.completed) {
      body = (
        <p className="crossed-out" data-prep-type={this.props.prep.prep_type}>{this.props.prep.question.contents}</p>
      )
    } else {
      body = <p data-prep-type={this.props.prep.prep_type}>{this.props.prep.prep_type}: {this.props.prep.question.contents}</p>
    }

    var buttons = (
      <div className="prep-item-button-container">
          <button className="prep-option-button edit-prep-button" onClick={this.showPrep} >Edit</button>
          <button className="prep-option-button done-prep-button" onClick={this.toggleCompletion}>Done</button>
          <button className="prep-option-button delete-prep-button" onClick={this.deletePrep}>Delete</button>
      </div>
    )



    return(
      <div onClick={this.showPrep} className="prep-item">
        {body}
        {buttons}
      </div>
    )
  }
});
