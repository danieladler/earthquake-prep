var ShowPrep = React.createClass({
  getInitialState: function() {
    return {notes: null};
  },
  noteSubmit: function(event) {
    event.preventDefault();
    var prep = this.props.prep;
    prep.notes = this.state.notes;
    this.props.updateNote(prep);
    this.setState({notes: null});
  },
  noteChanged: function(event) {
    this.setState({notes: event.target.value});
  },
  render: function() {
    var body;
    if(this.props.prep) {
      body = (
        <div>
          <h2>{this.props.prep.prep_type} Preparation:</h2>
          <p>{this.props.prep.question.contents}</p>
          <form onSubmit={this.noteSubmit}>
            <h3>Note:</h3>
            <p>{this.props.prep.notes}</p>
            <textarea onChange={this.noteChanged} name="notes"/>
            <input type="submit" value="Update Note" />
          </form>
        </div>
      )
    } else {
      body = <h2> select a prep on the left to edit </h2>
    }
    return(
      <div className="show-prep">
        {body}
      </div>
    )
  }
});
