var PrepList = React.createClass({
  render: function() {
    var prepDivs = [];

    for (var i = 0; i < this.props.preps.length; i++) {
      prepDivs.push(<PrepItem updatePrep={this.props.updatePrep} handleClick={this.props.handleClick} key={i} prep={this.props.preps[i]}/>)
    }

    return(
      <div className="prep-list">
        {prepDivs}
      </div>
    )
  }
});
