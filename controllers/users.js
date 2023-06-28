const router = require('express').Router()

const { User, Note, Team } = require('../models')

router.get('/', async (_req, res) => {
  const users = await User.findAll({
    include: [
      {
        model: Note,
        attributes: { exclude: ['userId'] }
      },
      {
        model: Team,
        attributes: ['name', 'id'],
        through: {
          attributes: []
        },
      },
    ],
  })
  res.json(users)
})

router.post('/', async (req, res) => {
  try {
    const user = await User.create(req.body)
    res.json(user)
  } catch (error) {
    return res.status(400).json({ error })
  }
})

router.get('/:id', async (req, res) => {
  const user = await User.findByPk(req.params.id, {
    attributes: { exclude: [''] },
    include: [{
      model: Note,
      attributes: { exclude: ['userId'] }
    },
    {
      model: Note,
      as: 'markedNotes',
      attributes: { exclude: ['userId'] },
      through: {
        attributes: []
      },
      include: {
        model: User,
        attributes: ['name']
      }
    },
    {
      model: Team,
      attributes: ['name', 'id'],
      through: {
        attributes: []
      }
    },
    ],
  })

  if (user) {
    res.json(user)
  } else {
    res.status(404).end()
  }
})

module.exports = router