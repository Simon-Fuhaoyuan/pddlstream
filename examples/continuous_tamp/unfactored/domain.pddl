(define (domain pick-and-place)
  (:requirements :strips :equality)
  (:predicates
    (Conf ?q)
    (Block ?b)
    (Pose ?b ?p)
    (Region ?r)
    (Traj ?t)
    (Kin ?b ?q ?p)
    (CFree ?b1 ?p1 ?b2 ?p2)
    (PoseCollision ?b1 ?p1 ?b2 ?p2)
    (TrajCollision ?t ?b2 ?p2)
    (UnsafePose ?b ?p)
    (UnsafeTraj ?t)
    (Contained ?b ?p ?r)
    (In ?b ?r)
    (Placeable ?b ?r)
    (Motion ?q1 ?t ?q2)

    (AtPose ?s ?b ?p)
    (AtConf ?s ?q)
    (Holding ?s ?b)
    (HandEmpty ?s)

    (Move ?s1 ?t ?s2)
    (Pick ?s1 ?b ?q ?p ?s2)
    (Place ?s1 ?b ?q ?p ?s2)

    (AtState ?s)
    (AtGoal)
    (SatisfiesGoal ?s)
  )
  (:action move
    :parameters (?s1 ?t ?s2)
    :precondition (and (Move ?s1 ?t ?s2)
                       (AtState ?s1))
    :effect (and (AtState ?s2)
                 (not (AtState ?s1)))
  )
  (:action pick
    :parameters (?s1 ?b ?q ?p ?s2)
    :precondition (and (Pick ?s1 ?b ?q ?p ?s2)
                       (AtState ?s1))
    :effect (and (AtState ?s2)
                 (not (AtState ?s1)))
  )
  (:action place
    :parameters (?s1 ?b ?q ?p ?s2)
    :precondition (and (Place ?s1 ?b ?q ?p ?s2)
                       (AtState ?s1))
    :effect (and (AtState ?s2)
                 (not (AtState ?s1)))
  )
  (:derived (AtGoal)
    (exists (?s) (and (SatisfiesGoal ?s)
                      (AtState ?s)))
  )
)