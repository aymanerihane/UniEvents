
class ParticipationController{
  static var _participation;

  get currentParticipation => _participation;
  set currentParticipation(participation) {
    _participation = participation;
  } 
}

